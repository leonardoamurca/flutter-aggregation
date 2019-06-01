import 'package:flutter_aggregation/services/translate.dart';
import 'package:hack19/hack19.dart';
import '../services/translate.dart';

abstract class BaseFeedResponse {
  Future<FeedTranslate> get({String feedUrl, String targetLanguage});
  Future<FeedTranslate> getAll({String targetLanguage});
}

class FeedItemTranslate {
  FeedItemTranslate({this.link, this.image, this.title, this.translatedLink});

  final String title;
  final String image;
  final String link;
  final String translatedLink;
}

class FeedTranslate {
  FeedTranslate({this.title, this.items});

  final String title;
  final List<FeedItemTranslate> items;
}

class FeedResponse implements BaseFeedResponse {
  FeedResponse({this.feedUrl});

  final String feedUrl;
  final BaseTranslate translate = new Translate();

  Future<FeedTranslate> get({String feedUrl, String targetLanguage}) async {
    final fetcher = FeedFetcher(feedUrl);
    final feed = await fetcher.fetch();

    List<FeedItemTranslate> items = [];

    for (var feedItem in feed.items) {
      final translatedLink = translate.translateLink(
        link: feedItem.link,
        targetLanguage: targetLanguage ?? 'en',
        sourceLanguage: 'en',
      );

      items.add(FeedItemTranslate(
        title: feedItem.title,
        image: feedItem.image,
        link: feedItem.link,
        translatedLink: translatedLink,
      ));
    }

    return FeedTranslate(title: feed.title, items: items);
  }

  Future<FeedTranslate> getAll({String targetLanguage}) async {
    List<String> feedUrls = [
      "https://medium.com/feed/flutter",
      "https://medium.com/feed/flutter-community",
      "https://medium.com/feed/dartlang",
      "https://stackoverflow.com/feeds/tag/flutter",
      "https://stackoverflow.com/feeds/tag/dart",
      "https://rsshub.app/github/issue/flutter/flutter",
      "http://pullfeed.co/feeds/flutter/flutter",
      "https://stackoverflow.com/jobs/feed?q=flutter",
    ];

    List<FeedItemTranslate> allFeedItems = [];

    for (var feedUrl in feedUrls) {
      final feedTranslate =
          await this.get(feedUrl: feedUrl, targetLanguage: targetLanguage);

      for (var feedTranslateItem in feedTranslate.items) {
        allFeedItems.add(feedTranslateItem);
      }
    }

    return FeedTranslate(title: 'all', items: allFeedItems);
  }
}

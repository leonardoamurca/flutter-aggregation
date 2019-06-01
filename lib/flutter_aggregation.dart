import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_aggregation/pages/home.dart';
import 'services/feed.dart';

class FlutterAggregation extends StatelessWidget {
  final BaseFeedResponse feedResponse = new FeedResponse();

  final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    "Dashboard": (context) => Home()
  };

  @override
  Widget build(BuildContext context) {
    // feedResponse
    //     .get(
    //   feedUrl: "https://medium.com/feed/flutter",
    //   targetLanguage: 'pt-BR',
    // )
    //     .then((feed) {
    //   print('feed.title: ${feed.title}');
    //   for (var feedItem in feed.items) {
    //     print('feedItem.title: ${feedItem.title}');
    //     print('feedItem.image: ${feedItem.image}');
    //     print('feedItem.link: ${feedItem.link}');
    //     print('feedItem.translatedLink: ${feedItem.translatedLink}');
    //   }
    // });

    feedResponse
        .getAll(
      targetLanguage: 'pt-BR',
    )
        .then((feed) {
      print('feed.title: ${feed.title}');
      for (var feedItem in feed.items) {
        print('feedItem.title: ${feedItem.title}');
        print('feedItem.image: ${feedItem.image}');
        print('feedItem.link: ${feedItem.link}');
        print('feedItem.translatedLink: ${feedItem.translatedLink}');
      }
    });

    return MaterialApp(
        title: 'Flutter Aggregation',
        theme: ThemeData(
          primaryColor: Color(0xff4791ff),
        ),
        debugShowCheckedModeBanner: false,
        home: Home(),
        routes: routes);
  }
}

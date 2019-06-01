import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_aggregation/pages/home.dart';
import 'package:flutter_aggregation/services/feed.dart';

class CardItem extends StatefulWidget {
  CardItem({this.cardModel});
  final FeedItemTranslate cardModel;

  @override
  State<StatefulWidget> createState() => _CardItem(cardModel: cardModel);
}

class _CardItem extends State<CardItem> {
  _CardItem({this.cardModel});
  final FeedItemTranslate cardModel;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'cardItem',
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(cardModel.image),
            ),
            Material(
              child: ListTile(
                title: Text(cardModel.title),
                subtitle: Text(cardModel.link),
              ),
            ),
          ])),
    );
  }
}

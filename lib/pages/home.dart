import 'package:flutter/material.dart';
import 'package:flutter_aggregation/pages/components/card_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var items = getMessages();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Aggregation'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, item) {
            return CardItem(
              cardModel: items[item],
            );
          },
        ),
      ),
    );
  }

  List<CardModel> getMessages() {
    return [
      CardModel(
          title: 'Flutter title',
          imageUrl: 'Flutter ImageUrl',
          message: 'Flutter message'),
      CardModel(
          title: 'Flutter title',
          imageUrl: 'Flutter ImageUrl',
          message: 'Flutter message'),
      CardModel(
          title: 'Flutter title',
          imageUrl: 'Flutter ImageUrl',
          message: 'Flutter message'),
      CardModel(
          title: 'Flutter title',
          imageUrl: 'Flutter ImageUrl',
          message: 'Flutter message'),
    ];
  }
}

class CardModel {
  CardModel({this.title, this.imageUrl, this.message});
  final String title;
  final String imageUrl;
  final String message;
}

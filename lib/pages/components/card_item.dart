import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_aggregation/pages/home.dart';

class CardItem extends StatelessWidget {
  CardItem({this.cardModel});
  final CardModel cardModel;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.ac_unit),
          title: Text(cardModel.title),
          subtitle: Text('Ola mundo'),
        ),
      ],
    ));
  }
}

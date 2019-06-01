import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_aggregation/pages/home.dart';
import 'services/translate.dart';

class FlutterAggregation extends StatelessWidget {
  final BaseTranslate translate = new Translate();

  final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    "Dashboard": (context) => Home()
  };

  @override
  Widget build(BuildContext context) {
    translate
        .translate(targetLanguage: 'fr', text: 'eu amo flutter')
        .then((translation) => print(translation.translatedText));

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

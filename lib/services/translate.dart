import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html_unescape/html_unescape.dart';

abstract class BaseTranslate {
  Future<Translation> translate({String targetLanguage, String text});
  String translateLink(
      {String sourceLanguage, String targetLanguage, String link});
}

class Translation {
  Translation({this.translatedText, this.detectedSourceLanguage});

  final String translatedText;
  final String detectedSourceLanguage;

  factory Translation.fromJson(Map<String, dynamic> json) {
    final _translation = json['data']['translations'][0];
    final unescape = new HtmlUnescape();

    return Translation(
      translatedText: unescape.convert(_translation['translatedText']),
      detectedSourceLanguage: _translation['detectedSourceLanguage'],
    );
  }
}

class Translate implements BaseTranslate {
  Future<Translation> translate({String targetLanguage, String text}) async {
    try {
      final response = await http.get(
          'https://translation.googleapis.com/language/translate/v2?target=$targetLanguage&q=$text&key=AIzaSyALscEwBIyfjApux0M62Z9Qvt3P4o_VrRY');

      final responseJson = json.decode(response.body);

      return Translation.fromJson(responseJson);
    } catch (error) {
      print('Failed to load post $error');
      return null;
    }
  }

  String translateLink(
      {String sourceLanguage, String targetLanguage, String link}) {
    try {
      return 'https://translate.google.com/translate?sl=$sourceLanguage&tl=$targetLanguage&u=$link';

      // final response = await http.get(
      //     'https://translation.googleapis.com/language/translate/v2?format=html&target=$targetLanguage&q=$link&key=AIzaSyALscEwBIyfjApux0M62Z9Qvt3P4o_VrRY');

      // final responseJson = json.decode(response.body);

      // return Translation.fromJson(responseJson);
    } catch (error) {
      print('Failed to load post $error');
      return null;
    }
  }
}

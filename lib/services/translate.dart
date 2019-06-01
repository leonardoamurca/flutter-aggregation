// import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class BaseTranslate {
  Future<Translations> translate();
}

class Translations {
  Translations({this.translatedText, this.detectedSourceLanguage});

  final String translatedText;
  final String detectedSourceLanguage;

  factory Translations.fromJson(Map<String, dynamic> json) {
    return Translations(
      translatedText: json['data.translations.translatedText'],
      detectedSourceLanguage: json['id'],
    );
  }
}

class Translate implements BaseTranslate {
  Future<Translations> translate() async {
    try {
      final response = await http.get(
          "https://translation.googleapis.com/language/translate/v2?target=pt-br&key=AIzaSyALscEwBIyfjApux0M62Z9Qvt3P4o_VrRY&q=i love flutter");

      return Translations.fromJson(json.decode(response.body));
    } catch (erro) {
      throw Exception('Failed to load post');
    }
  }
}

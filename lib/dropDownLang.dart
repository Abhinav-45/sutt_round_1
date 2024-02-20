import 'dart:convert';
import 'package:http/http.dart' as http;




class AvailLanguages {
  static Future<List<String>> getAvailLanguages() async {
    var url = Uri.https(
      'google-translate1.p.rapidapi.com',
      '/language/translate/v2/languages',
    );

    final response = await http.get(
      url,
      headers: {
        'Accept-Encoding': 'application/gzip',
        'X-RapidAPI-Key': 'e5b781254amsh3f03a7c4cc5b555p1ac419jsn7624297fc8d2',
        'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com',
      },
    );

    Map<String, dynamic> data = jsonDecode(response.body);
    List<String> languages = [];

    for (var i in data['data']['languages']) {
      languages.add(i['language']);
    }

    return languages;
  }
}





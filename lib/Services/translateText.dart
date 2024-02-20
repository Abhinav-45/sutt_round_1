import 'package:dio/dio.dart';

class TranslateText {
  static Future<List> translate(
      String message, String toLanguageCode, String sourceLanguageCode) async {
    Dio dio = Dio();
    dio.options.headers["X-RapidAPI-Key"] =
    "e5b781254amsh3f03a7c4cc5b555p1ac419jsn7624297fc8d2";
    dio.options.headers["X-RapidAPI-Host"] =
    "google-translate1.p.rapidapi.com";
    dio.options.headers["content-type"] = "application/x-www-form-urlencoded";
    dio.options.headers['Accept-Encoding'] = 'application/gzip';

    var encodedParams = {
      'q': message,
      'target': toLanguageCode,
      'source': sourceLanguageCode,
    };

    try {
      Response response = await dio.post(
          'https://google-translate1.p.rapidapi.com/language/translate/v2',
          data: encodedParams,
          options: Options(
            responseType: ResponseType.json,
          )
      );

      List<dynamic> translatedText = [];

      if (response.statusCode == 200) {
        final body = response.data;
        final translations = body['data']['translations'] as List;
        final translation = translations.first;
        translatedText.add(translation['translatedText']);

        return translatedText;
      }
      else if (response.statusCode == 403) {
        print("API request Not Authorised");
        return [];
      }
      else if (response.statusCode == 502) {
        print("Error from API");
        return [];
      }
      else {
        throw Exception();
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}






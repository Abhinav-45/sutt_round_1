import 'package:dio/dio.dart';

class LanguageDetector {

  Future detectLanguage(String text) async {

    Dio detect = Dio();
    detect.options.headers['X-RapidAPI-Key'] = 'e5b781254amsh3f03a7c4cc5b555p1ac419jsn7624297fc8d2';
    detect.options.headers['X-RapidAPI-Host'] = 'google-translate1.p.rapidapi.com';
    detect.options.headers['content-type'] = 'application/x-www-form-urlencoded';
    detect.options.headers['Accept-Encoding'] = 'application/gzip';

    var response = await detect.post(
      'https://google-translate1.p.rapidapi.com/language/translate/v2/detect',
      data: {'q':text},
      options: Options(
        responseType: ResponseType.json,
      ),
    );



    if (response.statusCode == 200) {
      var responseData = response.data;
      return responseData['data']['detections'][0][0]['language'];
    }
    else if (response.statusCode == 403) {
      print("API request Not Authorised");
    }
    else if (response.statusCode == 502) {
      print("Error from API");
    }
    else {
      throw Exception();
    }
  }
}







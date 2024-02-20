import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:sutt_round_1/Services/detectLang.dart';
import 'package:sutt_round_1/Services/translateText.dart';
import 'package:sutt_round_1/dropDownLang.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  Map<String, String> languageNames = {
    "af": "Afrikaans",
    "ak": "Akan",
    "am": "Amharic",
    "ar": "Arabic",
    "as": "Assamese",
    "ay": "Aymara",
    "az": "Azerbaijani",
    "be": "Belarusian",
    "bg": "Bulgarian",
    "bho": "Bhojpuri",
    "bm": "Bambara",
    "bn": "Bengali",
    "bs": "Bosnian",
    "ca": "Catalan",
    "ceb": "Cebuano",
    "ckb": "Central Kurdish",
    "co": "Corsican",
    "cs": "Czech",
    "cy": "Welsh",
    "da": "Danish",
    "de": "German",
    "doi": "Dogri",
    "dv": "Divehi",
    "ee": "Ewe",
    "el": "Greek",
    "en": "English",
    "eo": "Esperanto",
    "es": "Spanish",
    "et": "Estonian",
    "eu": "Basque",
    "fa": "Persian",
    "fi": "Finnish",
    "fr": "French",
    "fy": "Western Frisian",
    "ga": "Irish",
    "gd": "Scottish Gaelic",
    "gl": "Galician",
    "gn": "Guarani",
    "gom": "Goan Konkani",
    "gu": "Gujarati",
    "ha": "Hausa",
    "haw": "Hawaiian",
    "he": "Hebrew",
    "hi": "Hindi",
    "hmn": "Hmong",
    "hr": "Croatian",
    "ht": "Haitian Creole",
    "hu": "Hungarian",
    "hy": "Armenian",
    "id": "Indonesian",
    "ig": "Igbo",
    "ilo": "Iloko",
    "is": "Icelandic",
    "it": "Italian",
    "iw": "Hebrew",
    "ja": "Japanese",
    "jv": "Javanese",
    "jw": "Javanese",
    "ka": "Georgian",
    "kk": "Kazakh",
    "km": "Khmer",
    "kn": "Kannada",
    "ko": "Korean",
    "kri": "Krio",
    "ku": "Kurdish",
    "ky": "Kyrgyz",
    "la": "Latin",
    "lb": "Luxembourgish",
    "lg": "Ganda",
    "ln": "Lingala",
    "lo": "Lao",
    "lt": "Lithuanian",
    "lus": "Mizo",
    "lv": "Latvian",
    "mai": "Maithili",
    "mg": "Malagasy",
    "mi": "Maori",
    "mk": "Macedonian",
    "ml": "Malayalam",
    "mn": "Mongolian",
    "mni-Mtei": "Manipuri",
    "mr": "Marathi",
    "ms": "Malay",
    "mt": "Maltese",
    "my": "Burmese",
    "ne": "Nepali",
    "nl": "Dutch",
    "no": "Norwegian",
    "nso": "Northern Sotho",
    "ny": "Chichewa",
    "om": "Oromo",
    "or": "Oriya",
    "pa": "Punjabi",
    "pl": "Polish",
    "ps": "Pashto",
    "pt": "Portuguese",
    "qu": "Quechua",
    "ro": "Romanian",
    "ru": "Russian",
    "rw": "Kinyarwanda",
    "sa": "Sanskrit",
    "sd": "Sindhi",
    "si": "Sinhala",
    "sk": "Slovak",
    "sl": "Slovenian",
    "sm": "Samoan",
    "sn": "Shona",
    "so": "Somali",
    "sq": "Albanian",
    "sr": "Serbian",
    "st": "Southern Sotho",
    "su": "Sundanese",
    "sv": "Swedish",
    "sw": "Swahili",
    "ta": "Tamil",
    "te": "Telugu",
    "tg": "Tajik",
    "th": "Thai",
    "ti": "Tigrinya",
    "tk": "Turkmen",
    "tl": "Tagalog",
    "tr": "Turkish",
    "ts": "Tsonga",
    "tt": "Tatar",
    "ug": "Uighur",
    "uk": "Ukrainian",
    "ur": "Urdu",
    "uz": "Uzbek",
    "vi": "Vietnamese",
    "xh": "Xhosa",
    "yi": "Yiddish",
    "yo": "Yoruba",
    "zh": "Chinese",
    "zh-CN": "Chinese (Simplified)",
    "zh-TW": "Chinese (Traditional)",
    "zu": "Zulu"
  };
  String inputText = '';
  String detectedLanguage = '';
  String selectedLanguage = 'es';
  String translatedText = '';
  List<String> languages = [];

  @override
  void initState() {
    super.initState();
    fetchLanguages();
  }

  Future<void> fetchLanguages() async {
    languages = await AvailLanguages.getAvailLanguages();
    setState(() {});
  }

  Future<void> detectAndTranslate() async {
    print('Input text: $inputText');
    detectedLanguage = await LanguageDetector().detectLanguage(inputText);
    print('Detected language: $detectedLanguage');
    List<dynamic> translationResult = await TranslateText.translate(
        inputText, selectedLanguage, detectedLanguage);
    translatedText = translationResult.isNotEmpty
        ? translationResult[0]
        : 'Translation Error';
    setState(() {
      detectedLanguage=detectedLanguage;


      inputText = inputText;
      translatedText = translatedText;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Language Translator')),
      ),
      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter text to translate',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    inputText = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 40),

                  padding: EdgeInsets.fromLTRB(20,20,20,20),
                  color: Colors.grey.shade200,
                  child: Text(
                    'Detected Language: $detectedLanguage',
                    style: TextStyle(fontSize: 16),
                  ),
                ),

              ],
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButton<String>(
                value: selectedLanguage,
                items: languages.map<DropdownMenuItem<String>>((String value) {
                  String languageName = languageNames[value] ?? value;
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Icon(Icons.language),
                        SizedBox(width: 10),
                        Text(languageName),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                  });
                },

              ),
            ),

            SizedBox(height: 40),
            ElevatedButton(
              onPressed: detectAndTranslate,
              child: Text('Translate'),
            ),
            SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  padding: EdgeInsets.fromLTRB(20,20,20,100),
                  color: Colors.grey.shade200,
                  child: Text(
                    'Translated Text: $translatedText',
                    style: TextStyle(fontSize: 16),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}


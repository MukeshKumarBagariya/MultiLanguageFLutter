import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('es', ''), // Spanish, no country code
        const Locale('hi', ''),
        const Locale('pa', ''),
        const Locale('mr', ''),
        const Locale('te', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textFieldValueHolder = TextEditingController();
  String result = '';
  Translation translated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: textFieldValueHolder,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term'),
            ),
            Text(
              '$translated',
            style: TextStyle(fontSize: 20),),
            RaisedButton(
                child: Text('Hindi'),
                onPressed: _getHindiText
                ),
            RaisedButton(
                child: Text('Punjabi'),
                onPressed: _getPunjabiText
            ),
            RaisedButton(
                child: Text('Marathi'),
                onPressed: _getMarathiText
            ),
            RaisedButton(
                child: Text('Gujarati'),
                onPressed: _getGujaratiText
            ),
            RaisedButton(
                child: Text('Telugu'),
                onPressed: _getTeluguText
            ),
          ],
        ),
      ),
    );
  }

  void _getHindiText() {
    final translator = GoogleTranslator();
      result = textFieldValueHolder.text;
      translator.translate(result, from: 'en', to: 'hi').then((resultt) => {
        setState(() {
            translated = resultt;
        })
      });
  }

  void _getPunjabiText() {
    final translator = GoogleTranslator();
    result = textFieldValueHolder.text;
    translator.translate(result, from: 'en', to: 'pa').then((resultt) => {
      setState(() {
        translated = resultt;
      })
    });
  }

  void _getMarathiText() {
    final translator = GoogleTranslator();
    result = textFieldValueHolder.text;
    translator.translate(result, from: 'en', to: 'mr').then((resultt) => {
      setState(() {
        translated = resultt;
      })
    });
  }

  void _getGujaratiText() {
    final translator = GoogleTranslator();
    result = textFieldValueHolder.text;
    translator.translate(result, from: 'en', to: 'gu').then((resultt) => {
      setState(() {
        translated = resultt;
      })
    });
  }

  void _getTeluguText() {
    final translator = GoogleTranslator();
    result = textFieldValueHolder.text;
    translator.translate(result, from: 'en', to: 'te').then((resultt) => {
      setState(() {
        translated = resultt;
      })
    });
  }

  void _changeLanguage() async {
    final translator = GoogleTranslator();
    final input = "Здравствуйте. Ты в порядке?";

    translator
        .translate(input, to: 'en')
        .then((result) => print("Source: $input\nTranslated: $result"));

    var translation = await translator
        .translate("I would buy a car, if I had money.", from: 'en', to: 'it');

    print('Translated: ${await input.translate(to: 'en')}');

    translator.baseUrl = "translate.google.cn";
    translator.translateAndPrint("This means 'testing' in chinese",
        to: 'zh-cn');
    print("translation: $translation");
  }

}

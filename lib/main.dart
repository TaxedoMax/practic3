import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int textLength = 0;
  String infoText = 'Длина текста: 0';
  TextEditingController control = TextEditingController();

  void _getStringLength() {
    setState(() {
      textLength = control.text.length;
      infoText = 'Длина текста: ' + textLength.toString();
    });
  }

  void _clearText(){
    setState(() {
      control.text = '';
      _getStringLength();
    });
  }

  void _removeSpaces(){
    setState(() {
      String res = '';

      for(int i = 0; i < control.text.length; i++){
        if(control.text[i] != ' ') res += control.text[i];
      }

      control.text = res;
      _getStringLength();
    });
  }

  void _makeTextLowerCase(){
    setState(() {
      control.text = control.text.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              infoText,
              style: const TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 32
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              style:const TextStyle(fontSize: 27, fontFamily: 'Times New Roman', color: Colors.grey),
              controller: control,
              onChanged: (text){_getStringLength();},
              decoration: const InputDecoration(
                  hintText: 'Введите текст',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: (){_clearText();},
                child: const Text('Очистить', style: TextStyle(color: Colors.red),)
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: (){_removeSpaces();},
                child: const Text('Удалить пробелы')
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: (){_makeTextLowerCase();},
                child: const Text('Перевести текст в нижний регистр')
            )
          ],
        ),
      ),
    );
  }
}

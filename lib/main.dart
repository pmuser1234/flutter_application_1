import 'dart:math';

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
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 110, 255)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentFortune = "";
  final _fortuneList = [
    "You will get rich",
    "You will find a new friend",
    "you are dumb",
    "you need help",
    "you need to sleep",
  ];
  void _randomFortune() {
    setState(() {
      var random = Random();
      int fortune = random.nextInt(_fortuneList.length);
      _currentFortune = _fortuneList[fortune];
      print(_currentFortune);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Fortune Teller App",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*Text(
              "Your fortune is :",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),*/
            Card(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  '${_currentFortune}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: _randomFortune, child: Text("Get Fortune")),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _randomFortune,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:praveen_pilli/screen/mainscreen.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praveen Pilli',
      initialRoute: "praveenpilli",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(body: SingleChildScrollView(child: MainScreen())),
    );
  }
}

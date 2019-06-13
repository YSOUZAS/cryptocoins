import 'package:cryptocoins/pages/index.dart';
import 'package:cryptocoins/utils/injection_container.dart';
import 'package:flutter/material.dart';

void main() {
  initKiwi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.light,
          backgroundColor: Color(0xFF4527A0),
          accentColor: Colors.redAccent.shade400),
      home: ListPage(),
    );
  }
}

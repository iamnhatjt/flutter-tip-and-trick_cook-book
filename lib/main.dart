import 'package:flutter/material.dart';

import 'app_apge.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Robonto', primaryColor: Colors.amber),
      title: 'Flutter Demo',
      home: const AppPage(),
    );
  }
}

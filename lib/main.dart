import 'package:flutter/material.dart';
import 'package:flutter_cookbook/stateManagement/provider/provider_example.dart';
import 'package:provider/provider.dart';

import 'app_apge.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Counter(),
    child: (const MyApp()),
  ));
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

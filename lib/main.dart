import 'package:flutter/material.dart';
import 'package:flutter_cookbook/stateManagement/provider/provider_example.dart';
import 'package:provider/provider.dart';

import 'core/router_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Counter(),
    child: (const MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;
  void changeTheme() {
    setState(() {
      if (themeMode == ThemeMode.dark) {
        themeMode = ThemeMode.light;
      } else {
        themeMode = ThemeMode.dark;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: appRouterConFig,
      initialRoute: '/',
      themeMode: themeMode,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(fontFamily: 'Robonto', primaryColor: Colors.amber),
      title: 'Flutter Demo',
      // home: const AppPage(),
    );
  }
}

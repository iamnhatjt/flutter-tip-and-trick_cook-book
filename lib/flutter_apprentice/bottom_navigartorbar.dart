import 'package:flutter/material.dart';

class BottomNavigatorExample extends StatefulWidget {
  const BottomNavigatorExample({super.key});

  @override
  State<BottomNavigatorExample> createState() => _BottomNavigatorExampleState();
}

class _BottomNavigatorExampleState extends State<BottomNavigatorExample> {
  int indexPage = 0;

  void switchPage(int value) {
    setState(() {
      indexPage = value;
    });
  }

  List<Widget> ListPage = [
    Icon(Icons.home),
    Icon(Icons.chat_rounded),
    Icon(Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListPage[indexPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexPage,
        onTap: (value) {
          switchPage(value);
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'label Home', tooltip: 'tool tip'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded),
              label: 'label chart',
              tooltip: 'tool '),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'label setting',
              tooltip: 'tip'),
        ],
      ),
    );
  }
}

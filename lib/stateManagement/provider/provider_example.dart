import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'consumer_example.dart';

class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('provider example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<Counter>().count.toString(),
            ),
            SizedBox(
              height: 100,
            ),
            ConSumerExample()
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              context.read<Counter>().increment();
            },
          ),
          IconButton(
              onPressed: () {
                context.read<ConsumerCounter>().increment();
              },
              icon: Icon(Icons.add_alarm_sharp))
        ],
      ),
    );
  }
}

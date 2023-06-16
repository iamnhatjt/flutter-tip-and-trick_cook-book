import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConSumerExample extends StatelessWidget {
  const ConSumerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConsumerCounter(),
      child: Consumer(
        builder: (context, value, child) => Column(
          children: [
            Text(context.watch<ConsumerCounter>().counter.toString()),
            IconButton(
                onPressed: () {
                  context.read<ConsumerCounter>().increment();
                },
                icon: Icon(Icons.add_alarm_sharp))
          ],
        ),
      ),
    );
  }
}

class ConsumerCounter extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

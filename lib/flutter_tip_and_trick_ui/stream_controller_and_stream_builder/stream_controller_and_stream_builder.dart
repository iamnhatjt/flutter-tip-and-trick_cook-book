import 'dart:async';

import 'package:flutter/material.dart';

class StreamControllerAndStreamBuilder extends StatefulWidget {
  const StreamControllerAndStreamBuilder({super.key});

  @override
  State<StreamControllerAndStreamBuilder> createState() =>
      _StreamControllerAndStreamBuilderState();
}

class _StreamControllerAndStreamBuilderState
    extends State<StreamControllerAndStreamBuilder> {
  final _controller = StreamController<String>();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == 5) {
        _controller.close();
        timer.cancel();
      } else {
        _controller.add(DateTime.now().toString());
      }
    });
  }

  final items = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamController and StreamBuilder'),
      ),
      body: StreamBuilder(
        stream: _controller.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Has noData');
          }
          final item = snapshot.data as String;
          items.add(item);
          return ListView.separated(
            itemBuilder: (context, index) => ListTile(title: Text(item)),
            itemCount: items.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

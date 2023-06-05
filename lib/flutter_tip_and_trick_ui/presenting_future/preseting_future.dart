import 'package:flutter/material.dart';

Future<String> getName() async {
  return Future.delayed(Duration(seconds: 2), () => 'Jt_trinh this is my name');
}

class PresentingFuture extends StatelessWidget {
  const PresentingFuture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: getName(),
            builder: (context, snapshot) => snapshot.hasData
                ? Text(snapshot.data!)
                : CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_cookbook/core/router_page.dart';

class ArgumenNavitionExample extends StatelessWidget {
  const ArgumenNavitionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Argument navigator example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...List.generate(
            6,
            (index) => ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PathRoute.argumentLink,
                    arguments: index);
              },
              child: Text(
                index.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondArgumentNavigationWidget extends StatelessWidget {
  const SecondArgumentNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fetchValue =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no Value';
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          fetchValue,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

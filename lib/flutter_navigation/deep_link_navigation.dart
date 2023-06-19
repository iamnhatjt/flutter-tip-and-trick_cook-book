import 'package:flutter/material.dart';
import 'package:flutter_cookbook/core/router_page.dart';

class DeepLinkNavigationExample extends StatelessWidget {
  const DeepLinkNavigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deep Link navigation!'),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, PathRoute.simpleRoute);
          },
          icon: Icon(Icons.move_down),
        ),
      ),
    );
  }
}

class SecondDeepLinkWidget extends StatelessWidget {
  const SecondDeepLinkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.move_down),
        ),
      ),
    );
  }
}

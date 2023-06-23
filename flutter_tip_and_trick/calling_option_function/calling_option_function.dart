import 'package:flutter/material.dart';

class CallingExample extends StatelessWidget {
  const CallingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CallingChild();
  }
}

class CallingChild extends StatelessWidget {
  final VoidCallback? onPress;
  const CallingChild({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: () {
      onPress?.call();
    });
  }
}

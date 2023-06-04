import 'package:flutter/material.dart';

extension StrockeTextStyle on TextStyle {
  TextStyle withStroke({
    required double strokeWidth,
    required Color strockeColor,
  }) =>
      copyWith(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..color = strockeColor,
      );
}

class TextWithStroke extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double strokeWidth;
  final TextAlign textAlign;
  final Color strokeColor;
  const TextWithStroke({
    super.key,
    required this.text,
    this.style,
    this.strokeWidth = 2,
    this.textAlign = TextAlign.center,
    this.strokeColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: style?.withStroke(
            strockeColor: strokeColor,
            strokeWidth: strokeWidth,
          ),
        ),
        Text(
          text,
          style: style,
        )
      ],
    );
  }
}

class TextStroke extends StatelessWidget {
  const TextStroke({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Text Stroke'),
      ),
      body: Center(
        child: TextWithStroke(
          text: 'Jt_trinh hello every one, i gonna be better after day out',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

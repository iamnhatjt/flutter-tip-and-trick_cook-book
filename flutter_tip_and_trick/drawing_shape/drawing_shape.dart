import 'package:flutter/material.dart';

class CircleDrawing extends StatelessWidget {
  const CircleDrawing({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constrain) => Container(
              color: Colors.green,
              child: CustomPaint(
                size: Size(
                  constrain.maxWidth,
                  constrain.maxHeight,
                ),
                painter: MyCircleWidget(),
              ),
            ));
  }
}

class MyCircleWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}

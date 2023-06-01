import 'package:flutter/material.dart';

Route SlideAnimationSwitchPage(Widget page) {
  return PageRouteBuilder(
    barrierColor: Colors.black.withOpacity(0.3),
    pageBuilder: (context, animation, secondaryAnimation) {
      return SlideTransition(
        position: animation.drive(
          Tween(begin: const Offset(1, 0), end: Offset.zero),
        ),
        child: page,
      );
    },
  );
}

class TitleFontText extends StatelessWidget {
  final String title;
  const TitleFontText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.w400),
    );
  }
}

class SubScription extends StatelessWidget {
  final String title;
  final Widget newPage;
  const SubScription({super.key, required this.title, required this.newPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, SlideAnimationSwitchPage(newPage));
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('move page')));
      },
      child: Row(
        children: [
          const Text('•',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              )),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Text(title,
                style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 28,
                    fontWeight: FontWeight.w300)),
          )
        ],
      ),
    );
  }
}

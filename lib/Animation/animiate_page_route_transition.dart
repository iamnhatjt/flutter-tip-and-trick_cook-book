import 'package:flutter/material.dart';

class AnimatePageRote extends StatelessWidget {
  const AnimatePageRote({super.key});

  @override
  Widget build(BuildContext context) {
    Route animationSlide(Widget page) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
              position: animation.drive(
                  Tween(begin: const Offset(0, 1), end: const Offset(0, 0))),
              child: child);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animate page View',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w300, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'follow 5 step: to create a animation:',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            const Text('1, setup a pageRouteBulder',
                style: TextStyle(fontFamily: 'Roboto')),
            const Text('Add an AnimateWidget'),
            const Text('4, use a curveTween'),
            const Text('5, combine the two tweens'),
            ElevatedButton(
              child: const Text('move'),
              onPressed: () {
                Navigator.of(context).push(animationSlide(Scaffold(
                  appBar: AppBar(
                    title: const Text('back'),
                  ),
                  body: Container(
                    alignment: Alignment.center,
                    child: const Text(
                        'now let see, just use PageRouteBuilder and change animation befere child. gonna use the slide to change, some time may be opacity,....'),
                  ),
                )));
              },
            )
          ],
        ),
      ),
    );
  }
}

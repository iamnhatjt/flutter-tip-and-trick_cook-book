import 'package:flutter/material.dart';

class SimpleHeroExample extends StatelessWidget {
  const SimpleHeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero example navigator'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => _ChildrenHero(),
          ));
        },
        child: Hero(
          tag: 'HeroExample',
          child: Container(
              color: Colors.amber,
              child: FlutterLogo(
                size: 50,
              )),
        ),
      ),
    );
  }
}

class _ChildrenHero extends StatelessWidget {
  const _ChildrenHero();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'HeroExample',
        child: Center(
            child: FlutterLogo(
          size: 70,
        )),
      ),
    );
  }
}

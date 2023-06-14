import 'package:flutter/material.dart';

class MyInheritWidget extends InheritedWidget {
  final int counter;
  final bool isLoading;

  MyInheritWidget({
    required this.counter,
    required this.isLoading,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant MyInheritWidget oldWidget) {
    print('run it $counter');

    return counter != oldWidget.counter;
  }

  static MyInheritWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritWidget>();
  }
}

class showInheritedWidget extends StatelessWidget {
  const showInheritedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return stfInheritedWidget(child: AnotherChild());
  }
}

class AnotherChild extends StatelessWidget {
  const AnotherChild({super.key});

  @override
  Widget build(BuildContext context) {
    print('not rebuid this');
    return AnotherText();
  }
}

class AnotherText extends StatelessWidget {
  const AnotherText({super.key});

  @override
  Widget build(BuildContext context) {
    print('just renuild this');
    return Text(
      MyInheritWidget.of(context)?.counter.toString() ?? 'no value',
    );
  }
}

class stfInheritedWidget extends StatefulWidget {
  final Widget child;
  const stfInheritedWidget({super.key, required this.child});

  @override
  State<stfInheritedWidget> createState() => _stfInheritedWidgetState();
}

class _stfInheritedWidgetState extends State<stfInheritedWidget> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    print('draw showInheritedWidget!');
    return Scaffold(
      appBar: AppBar(
        title: Text('exmaple inheritedWidget'),
      ),
      body: MyInheritWidget(
        counter: counter,
        isLoading: false,
        child: Builder(builder: (context) {
          return Column(
            children: [
              CenterWidgetEx(),
              widget.child,
            ],
          );
        }),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}

class CenterWidgetEx extends StatelessWidget {
  const CenterWidgetEx({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('reDraw center');
    return Center(
      child: TextEX(),
    );
  }
}

class TextEX extends StatelessWidget {
  const TextEX({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('reDraw text');

    return Text(MyInheritWidget.of(context)!.counter.toString());
  }
}

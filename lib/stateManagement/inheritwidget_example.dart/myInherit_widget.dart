import 'package:flutter/material.dart';

class InheritWidgetExample extends InheritedWidget {
  final String name;
  InheritWidgetExample({
    super.key,
    required this.name,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static InheritWidgetExample? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritWidgetExample>();
}

class InheritedUi extends StatelessWidget {
  const InheritedUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('this is title of App bar'),
        backgroundColor: Colors.amber,
      ),
      body: InheritWidgetExample(
        name: 'jt trinh nhat',
        child: Builder(
          builder: (BuildContext innerContext) => Center(
            child: Column(
              children: [
                Text(
                    'hello world, who are you talking about: ${InheritWidgetExample.of(innerContext)?.name ?? 'nothign'}'),
                IconButton(
                  onPressed: () {
                    (InheritWidgetExample.of(innerContext)!.name ??
                            'oops nothing')
                        .substring(
                            0,
                            InheritWidgetExample.of(innerContext)
                                    ?.name
                                    .length ??
                                3 - 1);
                  },
                  icon: Icon(Icons.add),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

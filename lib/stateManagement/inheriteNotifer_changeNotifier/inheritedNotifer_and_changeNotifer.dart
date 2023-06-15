import 'package:flutter/material.dart';

class ValueSlider extends ChangeNotifier {
  double _value = 0.0;
  double get value => _value;

  set value(double newValue) {
    if (newValue != _value) {
      _value = newValue;
      notifyListeners();
    }
  }
}

class SlideInheritedNotifer extends InheritedNotifier<ValueSlider> {
  const SlideInheritedNotifer({
    Key? key,
    required ValueSlider sliderData,
    required Widget child,
  }) : super(key: key, notifier: sliderData, child: child);

  static double of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<SlideInheritedNotifer>()
          ?.notifier
          ?.value ??
      0.0;
}

ValueSlider valueSlider = ValueSlider();

class InheritedNotidierAndChangerNotifier extends StatelessWidget {
  const InheritedNotidierAndChangerNotifier({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("inheritedNotider and ChangeNotifier"),
      ),
      body: SlideInheritedNotifer(
        sliderData: valueSlider,
        child: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                  value: SlideInheritedNotifer.of(context),
                  onChanged: (value) {
                    valueSlider.value = value;
                  }),
              Row(
                children: [
                  Expanded(
                      child: Opacity(
                    opacity: SlideInheritedNotifer.of(context),
                    child: Container(
                      color: Colors.amber,
                      height: 100,
                    ),
                  )),
                  Expanded(
                      child: Opacity(
                    opacity: SlideInheritedNotifer.of(context),
                    child: Container(
                      color: Colors.red,
                      height: 100,
                    ),
                  ))
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}

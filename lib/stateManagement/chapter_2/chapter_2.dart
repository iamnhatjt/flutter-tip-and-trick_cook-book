import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Api {
  String? dateAndTime;

  Future<String> getDateAndTime() {
    return Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () => DateTime.now().toIso8601String(),
    ).then((value) {
      dateAndTime = value;
      return value;
    });
  }
}

class ApiProvider extends InheritedWidget {
  final Api api;
  final String uuid;

  ApiProvider({
    Key? key,
    required this.api,
    required Widget child,
  })  : uuid = const Uuid().v4(),
        super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant ApiProvider oldWidget) {
    return uuid != oldWidget.uuid;
  }

  static ApiProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ApiProvider>();
}

class Chapter2Example extends StatelessWidget {
  const Chapter2Example({super.key});

  @override
  Widget build(BuildContext context) {
    return ApiProvider(
        api: Api(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(ApiProvider.of(context)?.api.dateAndTime ?? ''),
          ),
          body: DateTimeWidget(),
        ));
  }
}

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final api = ApiProvider.of(context)?.api;

    return Text(
      api?.dateAndTime ?? 'tap onscreen to fetch date',
    );
  }
}

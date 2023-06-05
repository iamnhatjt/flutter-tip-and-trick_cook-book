import 'package:flutter/material.dart';

extension PresentAsyncSnapshot<E> on AsyncSnapshot<E> {
  Widget present({
    required BuildContext context,
    Widget Function(BuildContext context)? onNone,
    Widget Function(BuildContext context, E data)? onData,
    Widget Function(BuildContext context, Object error, StackTrace stackTrace)?
        onError,
    Widget Function(BuildContext context)? onDoneWithNeitherDataNoError,
    Widget Function(BuildContext context)? onWaiting,
  }) {
    switch (connectionState) {
      case ConnectionState.none:
        return onNone?.call(context) ?? const SizedBox.shrink();
      case ConnectionState.waiting:
        return onWaiting?.call(context) ?? const CircularProgressIndicator();
      case ConnectionState.active:
      case ConnectionState.done:
        if (hasError) {
          return onError?.call(context, error!, stackTrace!) ??
              const SizedBox.shrink();
        } else if (hasData) {
          return onData?.call(context, data as E) ?? const SizedBox.shrink();
        }
        return onDoneWithNeitherDataNoError?.call(context) ??
            const SizedBox.shrink();
    }
  }
}

Stream<String> getDataTime() => Stream.periodic(
      Duration(seconds: 1),
      (_) => DateTime.now().toIso8601String(),
    );

extension PresentStream<E> on Stream<E> {
  Widget present({
    Widget Function(BuildContext context)? onNone,
    Widget Function(BuildContext context, E data)? onData,
    Widget Function(BuildContext context, Object error, StackTrace stackTrace)?
        onError,
    Widget Function(BuildContext context)? onDoneWithNeitherDataNoError,
    Widget Function(BuildContext context)? onWaiting,
  }) {
    return StreamBuilder(
      stream: this,
      builder: (context, snapshot) {
        return snapshot.present(
          context: context,
          onNone: onNone,
          onData: onData,
          onError: onError,
          onDoneWithNeitherDataNoError: onDoneWithNeitherDataNoError,
          onWaiting: onWaiting,
        );
      },
    );
  }
}

class PresentingUi extends StatelessWidget {
  const PresentingUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('presenting stream'),
      ),
      body: getDataTime().present(
        onData: (_, dateTime) => Text(dateTime),
      ),
    );
  }
}

class PresentingUiVersion2 extends StatelessWidget {
  const PresentingUiVersion2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: getDataTime(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return Text(snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}

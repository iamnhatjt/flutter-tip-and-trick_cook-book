Future<int> doHeavyComputing(int index) =>
    Future.delayed(const Duration(seconds: 1), () {
      print('interation ${index + 1}');
      return index;
    });

Future<void> testIt() async {
  for (final future in Iterable.generate(10)
      .map(
        (e) => doHeavyComputing(
          e,
        ),
      )
      .take(5)) {
    print(await future);
  }
  ;
}

void main(List<String> args) {
  testIt();
}

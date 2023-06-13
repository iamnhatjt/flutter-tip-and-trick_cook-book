class OneBaseIndex {
  final int value;
  const OneBaseIndex(this.value) : assert(value > 1);

  int _interger({required dynamic from}) =>
      double.parse(from.toString()).toInt();

  @override
  String toString() => value.toString();

  OneBaseIndex operator +(dynamic other) =>
      OneBaseIndex(value + _interger(from: other));
}

void testIt() {
  final value = OneBaseIndex(10);
}

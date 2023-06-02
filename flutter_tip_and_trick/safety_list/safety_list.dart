import 'dart:collection';

class SafetyList<T> extends ListBase<T> {
  final List<T> _list;
  final T defaultValue;
  final T absentValue;

  SafetyList({
    required this.defaultValue,
    required this.absentValue,
    List<T>? value,
  }) : _list = value ?? [];

  @override
  set length(int newValue) {
    if (newValue < _list.length) {
      _list.length = newValue;
    } else {
      _list.addAll(List.filled(newValue - _list.length, defaultValue));
    }
  }

  @override
  int get length => _list.length;

  @override
  T operator [](int index) => index < _list.length ? _list[index] : absentValue;

  @override
  void operator []=(int index, T value) => _list[index] = value;

  @override
  T get first => _list.isNotEmpty ? _list.first : absentValue;

  @override
  T get last => _list.isNotEmpty ? _list.last : absentValue;
}

void testIt() {
  const notFound = 'NOT_FOUND';
  const defaultString = '';

  final myList = SafetyList(
    defaultValue: defaultString,
    absentValue: notFound,
    value: ['Bar', 'Baz'],
  );

  print(myList[0]); // Bar
  print(myList[1]); // Baz
  print(myList[2]); // NOT_FOUND

  myList.length = 4;
  print(myList[3]); // ''

  myList.length = 0;
  print(myList.first); // NOT_FOUND
  print(myList.last); // NOT_FOUND
}

void main(List<String> args) {
  testIt();
}

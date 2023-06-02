import 'dart:developer' as devtools show log;

extension Log on Object? {
  void log() =>
      devtools.log(this?.toString() ?? '\x1b[101m\x1b[30mNULL\x1b[0m');
}

void testIt([
  String? firstName,
  String lastName = 'Doe',
  String? address = 'NULL',
  int? age,
  List<Object> list1 = const [],
  List<Object>? list2,
]) {
  firstName.log(); // NULL (in colors)
  lastName.log(); // DOE
  address.log(); // NULL
  age.log(); // NULL (in colors)
  list1.log(); // []
  list2.log(); // NULL (in colors)
}

void main(List<String> args) {
  testIt();
}

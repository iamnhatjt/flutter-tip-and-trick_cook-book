// ignore: file_names

const personsAndAges = {
  'Andy': 42,
  'John': 30,
  'jane': 25, // lower-cased intentionally
  'Bob': 30,
  'Jenny': 25,
};

void testIt() {
  final canonicalizedMapVal = <String, int>{};
  personsAndAges.forEach((key, value) {
    canonicalizedMapVal.removeWhere((key, values) => values == value);
    canonicalizedMapVal[key.toLowerCase()] = value;
  });
  print(canonicalizedMapVal);
}

void main(List<String> args) {
  testIt();
}

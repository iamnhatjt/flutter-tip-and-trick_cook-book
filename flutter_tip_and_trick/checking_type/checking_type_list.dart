void doThis() {
  List<dynamic> a = [
    1,
    '3',
    [3],
    5
  ];
  final element = a.whereType<int>();
  print(element);
}

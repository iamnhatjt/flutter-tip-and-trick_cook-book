T? withAll<T>(
  List<T?> optionals,
  T Function(List<T>) callback,
) {
  return optionals.any((element) => element == null)
      ? null
      : callback(optionals.cast<T>());
}

String? getFullName(String? lastName, String? firstName) {
  return withAll([lastName, firstName], (p0) => p0.join(' '));
}

void main() {
  print(getFullName('jt', null));
  print(getFullName('jt', 'trinh'));
  print(getFullName(null, 'trinh'));
  print(getFullName(null, null));
}

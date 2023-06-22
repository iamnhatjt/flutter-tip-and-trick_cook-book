class Tuple<T, E> {
  final T value1;
  final E value2;
  const Tuple(this.value1, this.value2);
  @override
  String toString() => 'Tuple ($value1, $value2)';
}

Stream<Tuple<T, E>> zip<T, E>(List<T> lhs, List<E> rhs) async* {
  if (lhs.length != rhs.length) {
    throw ArgumentError('length of lists should be equal');
  }
  for (var i = 0; i < lhs.length; i++) {
    yield Tuple(lhs[i], rhs[i]);
  }
}

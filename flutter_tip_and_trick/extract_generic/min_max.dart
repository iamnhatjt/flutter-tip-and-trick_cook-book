extension MinMax<T extends num> on List<T> {
  T get max => _sorted.first;

  T get min => _sorted.last;

  List<T> get _sorted => [...this]..sort();
}

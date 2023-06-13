class Age implements Comparable {
  final int value;
  const Age(this.value);

  @override
  int compareTo(other) {
    try {
      final intValue = double.parse(other.toString()).toInt();
      return value.compareTo(intValue);
    } catch (_) {
      rethrow;
    }
  }

  @override
  bool operator ==(covariant Age other) => other.value == value;

  @override
  int get hashCode => value.hashCode;
}

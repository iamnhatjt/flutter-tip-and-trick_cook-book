const values = ['foo', 'bar', 'baz'];

void insteadOfThis() {
  for (var i; i < values.length; i++) {
    final value = values[i];
    print('value$value at index $i');
  }
}

void doThis() {
  values.asMap().forEach((key, value) {
    print('value is $value at index $key');
  });
}

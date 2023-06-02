extension Find<K, V, R> on Map<K, V> {
  R? find<T>(
    K key,
    R? Function(T value) cast,
  ) {
    final value = this[key];
    if (value is T) {
      return cast(value);
    } else {
      print('key not find the type $T');
    }
    return null;
  }
}

const json = {'name': 'Foo bar', 'age': 20};

void main(List<String> args) {
  json.find('age', (int value) => print('value is $value'));
  json.find('name', (int value) => print('value is $value'));
}

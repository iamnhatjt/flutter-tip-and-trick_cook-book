enum PropertyKey { name, age }

class Person {
  final _value = <PropertyKey, dynamic>{
    PropertyKey.name: null,
    PropertyKey.age: null,
  };

  Person({
    required String name,
    required int age,
  }) {
    _value[PropertyKey.name] = name;
    _value[PropertyKey.age] = age;
  }

  operator [](PropertyKey value) => _value[value];
  operator []=(PropertyKey key, dynamic value) => _value[key] = value;
}

void testIt() {
  final foo = Person(name: 'jt trinh', age: 22);
  print(foo[PropertyKey.name]); // jt trinh
  foo[PropertyKey.name] = 'foo';
  print(foo[PropertyKey.name]); // name
}

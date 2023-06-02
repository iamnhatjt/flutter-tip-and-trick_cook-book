class Person {
  final int age;

  Person({
    required this.age,
  }) {
    if (age < 0) {
      throw Exception('Age must be positive');
    }
    if (age > 100) {
      throw 'some thing > 100';
    }
  }
}

void tryCreatingPerson({int age = 0}) {
  try {
    print(Person(age: age).age);
  } catch (e) {
    print(e.runtimeType);
    print(e);
  }
}

void main(List<String> args) {
  tryCreatingPerson(age: 20);
  tryCreatingPerson(age: -1);
  tryCreatingPerson(age: 141);
}

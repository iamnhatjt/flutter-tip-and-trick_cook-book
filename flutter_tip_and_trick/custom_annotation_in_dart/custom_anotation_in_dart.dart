class Throws<T extends Type> {
  final List<T> exceptions;
  const Throws(this.exceptions);
}

class Animal {
  final int age;
  const Animal(this.age);
  @Throws([UnimplementedError])
  void run() => throw UnimplementedError();
}

class DogIsTooOldException {
  @override
  String toString() => 'Dog is too old';
}

class DogIsTiredExeption {
  @override
  String toString() => 'Dog is too old';
}

class Dog extends Animal {
  final bool isTooOld;
  const Dog(this.isTooOld, int age) : super(age);

  @Throws([DogIsTiredExeption, DogIsTooOldException])
  @override
  void run() {
    if (isTooOld) {
      throw DogIsTooOldException();
    } else if (age > 15) {
      throw DogIsTiredExeption();
    } else {
      print('some thing');
    }
  }
}

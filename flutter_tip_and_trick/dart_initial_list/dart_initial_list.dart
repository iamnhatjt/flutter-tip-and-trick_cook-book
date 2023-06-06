enum AnimalType { dog, cat }

class Animal {
  String name = '';
  final AnimalType type;
  Animal(this.type);
  Animal.dog() : type = AnimalType.dog;
}

class Person {
  final String name;
  final int age;
  final String address;

  Person({
    required this.age,
    required this.address,
    required this.name,
  });

  Person.jt_trinh()
      : this.name = 'jt_trinh',
        this.age = 22,
        this.address = 'VN';

  @override
  String toString() {
    return '$name $address $age';
  }
}

void main(List<String> args) {
  print(Person.jt_trinh().toString());
}

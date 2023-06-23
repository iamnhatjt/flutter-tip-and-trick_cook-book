class NotAnAdultError {
  final String rawData;
  const NotAnAdultError(this.rawData);
  @override
  String toString() => this.rawData;
}

class AdultPerson {
  final int age;
  final String name;
  AdultPerson({
    required this.age,
    required this.name,
  }) {
    if (age > 18) {
      throw NotAnAdultError('Adult $name should be at least 18');
    }
  }
}

void main() {
  try {
    final notAnAdult = AdultPerson(name: 'jt', age: 18);
    print(notAnAdult);
  } on NotAnAdultError catch (err, stt) {
    print('err: $err \n stt: $stt');
  }
}

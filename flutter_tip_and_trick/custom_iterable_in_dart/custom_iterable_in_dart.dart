enum Realtionship { mother, father }

class Person {
  final String name;
  final Realtionship realtionship;
  const Person(this.name, this.realtionship);
  const Person.mother()
      : name = 'mother',
        realtionship = Realtionship.mother;
  const Person.father()
      : name = 'father',
        realtionship = Realtionship.father;
  @override
  String toString() => 'name: $name, realationShip: $realtionship';
}

class Family extends Iterable {
  final Set<Person> members;
  const Family(this.members);

  @override
  Iterator get iterator => members.iterator;
}

void testIt() {
  final members = <Person>{Person.father(), Person.mother()};
  final fullHouse = Family(members);
  fullHouse.forEach(print);
}

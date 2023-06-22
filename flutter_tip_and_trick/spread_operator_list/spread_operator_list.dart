final List<String>? dogNames = null;
const catName = ['cat1', 'cat2'];
const List<String?> personName = ['person1', 'person2'];

void donotDoThis() {
  var name = <String>[];
  name.addAll(dogNames ?? []);
  name.addAll(catName);
  name.addAll(personName.whereType<String>());
}

void doThis() {
  final name = [
    ...?dogNames,
    ...catName,
    ...personName.whereType<String>(),
  ];
}

extension OptionalFirst<T> on Iterable<T> {
  T? get optionalFirst => isEmpty ? null : first;
}

void printName([String? name, List<String>? listSomeThing]) {
  listSomeThing?.optionalFirst == null
      ? print('no element first')
      : print(listSomeThing?.optionalFirst);
}

void main(List<String> args) {
  // normal when iterable is empty, call first element gonna throw exception
  printName(); // prints 'No name is found'
  printName('Foo'); // prints Foo
  printName(null, []); // prints 'No name is found'
  printName(null, ['Bar']); // prints Bar
}

import 'dart:collection';

class Stack<T> extends Iterable {
  final _value = Queue<T>();

  void push(T value) => _value.addLast(value);
  void pushMany(List<T> values) => _value.addAll(values);

  void pop() => _value.removeLast();
  void popMany(int n) => List.generate(n, (index) => pop());
  void popAll() => popMany(_value.length);
  @override
  Iterator get iterator => _value.toList().reversed.iterator;
}

void testIt() {
  print('it gonna work like stack');
}

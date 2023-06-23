extension RemovingDuplicate<T> on List<T> {
  List<T> get removeDuplicate => [
        ...{...this}
      ];
}

void main() {
  final a = ['hello', 'nhat', 'jt', 'hello'];
  print(a.removeDuplicate);
}

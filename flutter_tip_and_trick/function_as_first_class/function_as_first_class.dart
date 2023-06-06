void insteaOfThis() {
  Stream.periodic(Duration(seconds: 1), (e) => e).take(15).forEach((element) {
    return print(element);
  });
}

void doThis() {
  Stream.periodic(Duration(seconds: 1), (e) => e).take(15).forEach(print);
}

void main() {
  doThis();
}

Stream<int> numbers({
  int start = 0,
  int end = 4,
  IsIncluded? f,
}) async* {
  for (var i = start; i < end; i++) {
    if (f == null || f(i)) {
      yield i;
    }
  }
}

typedef IsIncluded = bool Function(int value);

bool evenNumberOnly(int value) => value % 2 == 0;
bool oldNumberOnly(int value) => value % 2 == 1;

void main(List<String> args) async {
  await for (final value in numbers()) {
    print(value);
  }
  print("---------------------");
  await for (final value in numbers(
    end: 10,
    f: evenNumberOnly,
  )) {
    print(value);
  }
  print("---------------------");
  await for (final value in numbers(
    end: 10,
    f: oldNumberOnly,
  )) {
    print(value);
  }
}

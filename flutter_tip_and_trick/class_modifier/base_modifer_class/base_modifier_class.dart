// only force inheritance of a class  or mixin's implementation
// use the base  modifier. A base class disabllows implementation
//outside  of its own library.

base class BaseClassTest {
  final String name;
  final int age;
  const BaseClassTest({
    required this.name,
    required this.age,
  });
}

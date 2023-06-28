// extend

import 'common.dart';

// this is extend: a class to crate a new subtype.
class JtTrinh extends Person {
  const JtTrinh({
    required super.name,
    required super.age,
  });
}

// imple ent: a class or mixin interface.....

/*
in this example, look at class person, person decalare with no modifer,
so JtTrinh2 implements Person, Person look like a interface(oop) but in dart,
dart auto make get, set for us, so we need to override this in here.
*/
class JtTrinh2 implements Person {
  @override
  int get age =>
      throw ('do not use this way to create, not clear code, bad state');

  @override
  String get name =>
      throw ('do not use this way to create implement, not clear code, bad state');
}

/*
mixin a mixn or mixin class
//todo try some test code right here.

*/
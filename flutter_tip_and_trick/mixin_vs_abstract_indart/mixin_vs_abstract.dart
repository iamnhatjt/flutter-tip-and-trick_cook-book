mixin canWalk {
  void walk() => print('Walking ...');
}

mixin CanDrive {
  void drive() => print('can drive');
}

mixin canDescribeself {
  void describeSelf();
}

abstract class Human with canDescribeself {
  const Human();
  void breath() {
    print('Breathing...');
  }

  void eat() => print('eating...');
}

class Child extends Human with canWalk {
  const Child();

  @override
  void describeSelf() {
    print("i'm a child");
  }
}

class Adult extends Human with canWalk, CanDrive {
  const Adult();

  @override
  void describeSelf() {
    print('i\'m a adult');
  }

  @override
  void breath() => print('human breathing ...');

  @override
  void walk() => print('human is eating...');
}

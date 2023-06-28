import 'abstract.dart';

class JtTrinhAbstract1 extends TestAbstractClass {
  @override
  void abstractMethod() {
    print('need overide abstract method');
  }
}

class JtTrinhAbstract2 implements TestAbstractClass {
  JtTrinhAbstract2({
    required this.abstractVariableB,
    required this.abstractVariablea,
  });
  @override
  final String abstractVariableB;

  @override
  final int abstractVariablea;

  @override
  void abstractMethod() {
    // TODO: implement abstractMethod
  }

  @override
  void notAabstractMethod() {
    // TODO: implement notAabstractMethod
  }

  @override
  set abstractVariableB(String _abstractVariableB) {
    // TODO: implement abstractVariableB
  }

  @override
  set abstractVariablea(int _abstractVariablea) {
    // TODO: implement abstractVariablea
  }
}

/// kind of not clear with use abstract class like mixin in design partten programming langue
/// have to use right way to use it. 
/// ex: only use implemnt with interface class, or only use abstract class with extends. it up to you.

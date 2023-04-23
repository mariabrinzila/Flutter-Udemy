import 'package:dart_basics/dart_basics.dart' as dart_basics;

void main() {
  print(dart_basics.addNumbers(1, 2.9));

  // var varName = value <=> declaring a variable for the first time
  // instead of var, we can used any other type (string, int, double etc.)
  // the variable type can be inferred from the value (aResult is dynamic just like the return type of addNumbers)
  var aResult = dart_basics.addNumbers(1, 5);

  print(aResult);

  // when not initializing a variable, it's better to use the type the value it'll eventually have has than var
  double a;

  a = 1.5 + 1;

  print(a + 2);

  // instance of a class <=> an object
  var p1 = dart_basics.Person('Maria', 23);

  print(p1);
  print(p1.age);

  p1.name = 'Another name than Maria';

  print(p1.name);

  var p2 = dart_basics.DifferentPerson(name: 'Maria2');

  print(p2);
  print(p2.age);
}

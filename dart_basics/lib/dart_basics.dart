// dynamic type <=> used for any function, function parameter or variable that doesn't have any other specified type (addNumbers is dynamic)
// String <=> between '' or "" ('Hello')
// int <=> numbers with no decimals (23, -1)
// float and double <=> numbers with decimals (29.99)
// num <=> integers and doubles
addNumbers(double num1, double num2) {
  print("Hello");

  return num1 + num2;
}

// dart is object-oriented <=> everything is dart is an object (variables, numbers etc.)
// class <=> create the blueprint for objects
class Person {
  // method <=> a function inside a class
  // property <=> a variable inside a class
  // dataType? <=> the property can be null
  String? name;

  // properties can have default value
  var age = 10;

  // constructor <=> a method that only gets executed once, when we create a new instance of that class
  Person(String inputName, int age) {
    name = inputName;
    this.age = age;
  }
}

class DifferentPerson {
  String? name;
  int? age;

  // positional argument <=> a function / method parameter that needs to be put in the right position / order (context for the build method)
  // [b] <=> positional parameter that is optional
  // [b = defValue] <=> assign a default value to an optional positional parameter

  // named argument <=> a function / method parameter that isn't passed in order, it's targeted by its name (home: aWidgetName)
  // {par1, par2, ...} <=> named parameters (are all optional)
  // named parameters can be used for any method / function
  // named arguments can have default values (the default value for age is 30)
  // {par1 = defVal} <=> assign a default value to a named parameter
  // required / @required <=> the named parameter must be initialized, it's no longer optional
  // if a named parameter is omitted and doesn't have a default value, it's automatically assigned with null

  // positional and named parameters can be mixed and matched (void add(a, {b, c}) { ... })

  // className(this.prop1, this.prop2, ...) <=> a simplified constructor, it automatically does the assignments
  DifferentPerson({required this.name, this.age = 30});
}

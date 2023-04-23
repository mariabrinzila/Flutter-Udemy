import 'package:flutter/material.dart';

import 'package:roll_dice_app/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  final List<Color> colors;
  // here we could also just accept 2 colors, not a list of colors
  const GradientContainer({super.key, required this.colors});

  const GradientContainer.alternativeColors({super.key})
      : colors = const [
          Color.fromARGB(255, 215, 166, 238),
          Color.fromARGB(255, 81, 23, 91),
        ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // set a background color gradient (it automatically goes from left to right)
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          // make the gradient go from top to bottom
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}

// variables with the var keyword can be re-assigned
// since var variables can be re-assigned, they shouldn't be used in a const widget (we can't tell Dart we can re-use that widget since the variables aren't locked in, they could change)
// var a; <=> the a variable is of type dynamic since Dart can't infer it's type from the assignment
// dynamic types accept all types
// if we don't assign a var variable a type when we declare it, the variable's type should be mentioned instead of var (dartType? varName;)
// if we know a variable's initialization value won't ever change, it's recommended we use final instead of var
// final <=> a variable (data container) will never receive a new value
// const also makes sure that we can't re-assign the value of a variable
// const tells Dart that the value assigned on the right of the = is a compiled time constant, it's locked in at the point in time when the code is compiled
// final tells Dart that the value assigned is an execution time constant, it's locked in at the point in time when the code is executed (for example when storing the result of a function which will have to be executed for the variable to have its value)
// with using const / final variables, they can be used in constant widgets since we know they are locked in

// even though a list is marked final, by default lists can be edited <=> we can't use them in constant widgets

// widgets can have multiple constructor <=> className.name() : arg1 = val1, ...;
// the constructor will be called className.name() where we need it

// Image.asset(imagePath) <=> for locally stored images
// Column / Row <=> widgets that allow us to place multiple child widgets above / next to each other
// Column / Row take all the available vertical / horizontal space by default (the default mainAxisSize is MainAxisSize.max)

// () {} <=> anonymous empty function

// padding: const EdgeInsets.only(top: 10,) <=> put some space between 2 widgets
// the alternative to adding some space between 2 widgets (instead of using padding) is using an extra widget, SizedBox
// SizedBox <=> a widget that creates a box of a certain size
// most widgets simply take the height and width they need to fit their content into themselves 
// SizedBox's size doesn't change (for example if we had a child widget in a SizedBox and the content would go past the set dimensions, that content would be cut)

// Dart goes through this file from top to bottom and reads it from top to bottom (parsed from top to bottom)
// The code is compiled by Dart and the Flutter tools (it's translated into native iOS or Android machine code)
// The native code resulted is executed on the mobile devices
import 'package:flutter/material.dart';

import 'package:roll_dice_app/gradient_container.dart';

// main() <=> a function that is automatically executed when the app starts because it's in the main.dart file
// every Flutter app is all about the widgets (it's a tree of widgets)
// functionType name(params) => expression; <=> a shortcut for functions that only have one expression (only one line of code in the function), the result of that expression being automatically returned
// runApp() <=> the function that builds the main widget and calls build() on it (takes our widget tree and tries to draw something on the screen)
void main() {
  const List<Color> colors = [
    Color.fromARGB(255, 29, 4, 72),
    Color.fromARGB(255, 131, 59, 143),
  ];

  runApp(
    // const helps Dart optimize the runtime performace of our application (it allows Dart to re-use values, widgets / combination of widgets that are equal and avoids the duplication of data in the memory)
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(colors: colors),
      ),
    ),
  );
}

// widget <=> a special type of object (which extends StatelessWidget or StatefulWidget)
// inheritance <=> a class that gets all the features of a class and can add new features on top of those
// only one class can be extended at a time

// @override <=> a decorator that makes it clear a method is overried from the class we're extending
// build() <=> the method that Flutter will call when it wants to draw something on the screen (it returns a widget tree)
// everything that belongs to a widget should be in the same class so that the widget is a standalone unit

// MaterialApp <=> a widget that does some base setup to turn your combination of widgets into a real app that can be rendered
// Scaffold <=> a widget that creates a base page design
// Center <=> a widget that centers another widget / widget tree
// AppBar <=> a widget that creates an app bar
// Container <=> a widget that belongs in both categories of widgets, it's invisible by default but can be given styles so we can see it

// Container doesn't support const (so it and its parent can't have const)
// input & output (visible) widgets <=> the widgets that are drawn on the screen, that the user sees (RaisedButton, Text, Card etc.)
// layout & control (invisible) widgets <=> the widgets that give us structure, that control how visible widgets are drawn onto the screen, we don't see on the screen, that help us with structuring our content (Column, Row, ListView etc.)

// it's a good practice to break up widget trees, to outsource a part of the widget tree into a custom widget (put one into a custom widget) so we can re-use the widget tree and so that the code is more readable
// custom widgets are classes, just like all the other built-in widgets
// whenever Flutter finds our widget in a widget tree or passed to the runApp() method, it'll automatically call the build() method for us
// custom widgets should have a constructor added to them (typically we don't need to add one, the className() which is the empty constructor is added automatically to every class)
// key <=> a special argument that should be added as a named parameter to the custom widget constructor and which is forwarded to StatelessWidget
// super <=> a keyword that helps us reach out to the parent class (the one we're extending)
// super() <=> calls the constructor of the parent class
// customWidget({key}): super(key: key); <=> forward the key parameter in customWidget to the parent class (for example StatelessWidget)
// customWidget({super.key}); <=> shortcut for forwarding the key parameter to the parent class
// we need to have this constructor with key in every custom widget
// const constructor <=> it tells Dart that this class can be optimized, that can be stored in the memory so that it can be re-used 

// it's a good practice to put classes in separate files

// dartType? <=> a nullable variable of type dartType
// generic type <=> a type that is "flexible" and "works together" with other types (for example List<T>)
// listName.elementAt(index), listName[index] <=> access the element at a specific index in a list
// lists can have elements of the same type or of mixed types ([1, 'a string', 5.99])

// backgroundColor: Color.fromARGB(255, 47, 12, 107) <=> set the background color of a widget (for example Scaffold)

// onPressed: null <=> when you press the button, nothing will happend and Flutter automatically makes the button disabled
// onPressed <=> receives a function with no parameters and returns void
// onPressed: fctName() <=> onPressed is given the result of executing fctName(), not a function and so it causes an error (we want that function to be executed when the user pressed the button so we need to pass a pointer to it, the function's name, not execute it and pass the result of it)
// named function <=> a function that has a name (answerQuestion)
// anonymous function <=> a function that doesn't have a name (() => expression; or () { // function body })

// state <=> the data / information used by our app (username, the question index etc.)
// app state <=> authenticated users, loaded jobs etc.
// widget state <=> current user input, is a loading spinner being shown, which question is currently selected etc.
// input / external data <=> the data received via the constructor of a widget
// stateless widget <=> a widget that doesn't have a state, one that is only concerned with outputting data with certain styles or structure, the data inside the widget will never change and we can only receive new data from outside (input data) and that will re-buid the widget, the widget is re-rendered when the input data changes (Text)
// stateful widget <=> a widget that changes data, it has a build() method that renders the UI, it has input data that can change externally but it also has an internal state and the widget will be re-rendered whenever either the input data or the internal state changes
// the core difference between stateless and stateful widgets is that a stateless one will only be re-rendered when the input data changes and the stateful one will be re-rendered when the input data or the internal state changes
// a stateless widget can't tell Flutter to re-run the build() method when its properties change

// a stateful widget has 2 classes <=> our widget widgetName that extends StatefulWidget and widgetNameState that extends State, which is a generic class so it needs to receive a pointer to our widget State<widgetName>
// we need 2 classes because the widget can be re-created but the state is persistent, it's attached to the widget but unlike that widget, it's not re-created, the data in the state isn't re-set when the widget is re-created

// createState() <=> a method that establishes the connection between the stateful widget and its state, we create a new object based on that state class
// the build() method will be inside the state, not the stateful widget

// Flutter doesn't re-render the UI when a button is tapped
// the code that changes the state needs to be wrapped in setState() so Flutter knows it needs to re-render the UI since the state has changed
// setState() <=> a function that is provided by State, it takes a function and inside this function we need to have the code that changes the state
// without the setState() method, the widget doesn't re-run the build() method even though the properties' values are changed, setState() is a trigger that informs Flutter that it needs to re-run the build() method

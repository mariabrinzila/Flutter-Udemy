import 'package:flutter/material.dart';

// main() <=> a function that is automatically executed when the app starts because it's in the main.dart file
// every Flutter app is all about the widgets (it's a tree of widgets)
// functionType name(params) => expression; <=> a shortcut for functions that only have one expression (only one line of code in the function), the result of that expression being automatically returned
// runApp() <=> the function that builds the main widget and calls build() on it (takes our widget tree and tries to draw something on the screen)
void main() => runApp(MyApp());

// widget <=> a special type of object (which extends StatelessWidget or StatefulWidget)
// inheritance <=> a class that gets all the features of a class and can add new features on top of those
// only one class can be extended at a time

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
class MyApp extends StatefulWidget {
  // createState() <=> a method that establishes the connection between the stateful widget and its state, we create a new object based on that state class
  // the build() method will be inside the state, not the stateful widget
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  // everything that belongs to a widget should be in the same class so that the widget is a standalone unit
  void answerQuestion() {
    // Flutter doesn't re-render the UI when a button is tapped
    // the code that changes the state needs to be wrapped in setState() so Flutter knows it needs to re-render the UI since the state has changed
    // setState() <=> a function that is provided by State, it takes a function and inside this function we need to have the code that changes the state
    // without the setState() method, the widget doesn't re-run the build() method even though the properties' values are changed, setState() is a trigger that informs Flutter that it needs to re-run the build() method
    setState(() {
      questionIndex++;
    });

    print(questionIndex);
  }

  // @override <=> a decorator that makes it clear a method is overried from the class we're extending
  // build() <=> the method that Flutter will call when it wants to draw something on the screen (it returns a widget tree)
  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];

    // MaterialApp <=> a widget that does some base setup to turn your combination of widgets into a real app that can be rendered
    // Scaffold <=> a widget that creates a base page design
    // AppBar <=> a widget that creates an app bar
    // input & output (visible) widgets <=> the widgets that are drawn on the screen, that the user sees (RaisedButton, Text, Card etc.)
    // layout & control (invisible) widgets <=> the widgets that give us structure, that control how visible widgets are drawn onto the screen, we don't see on the screen, that help us with structuring our content (Column, Row, ListView etc.)
    // Container <=> a widget that belongs in both categories of widgets, it's invisible by default but can be given styles so we can see it

    // listName.elementAt(index), listName[index] <=> access the element at a specific index in a list
    // lists can have elements of the same type or of mixed types ([1, 'a string', 5.99])

    // onPressed: null <=> when you press the button, nothing will happend and Flutter automatically makes the button disabled
    // onPressed <=> receives a function with no parameters and returns void
    // onPressed: fctName() <=> onPressed is given the result of executing fctName(), not a function and so it causes an error (we want that function to be executed when the user pressed the button so we need to pass a pointer to it, the function's name, not execute it and pass the result of it)
    // named function <=> a function that has a name (answerQuestion)
    // anonymous function <=> a function that doesn't have a name (() => expression; or () { // function body })
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My First App',
          ),
        ),
        body: Column(
          children: [
            Text(
              questions.elementAt(questionIndex),
            ),
            RaisedButton(
              child: Text(
                'Answer 1',
              ),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text(
                'Answer 2',
              ),
              onPressed: () => print('Answer 2 chosen'),
            ),
            RaisedButton(
              child: Text(
                'Answer 3',
              ),
              onPressed: () {
                print('Answer 3 chosen');
              },
            ),
          ],
        ),
      ),
    );
  }
}

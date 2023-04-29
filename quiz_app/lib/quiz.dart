import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // activeScreen is specified as a Widget since Widget is the general type and otherwise, the variable would infer its type from the value and so be of type StartScreen
  Widget? activeScreen;
  var differentActiveScreen = 'start-screen';

  List<String> selectedAnswers = [];

  @override
  void initState() {
    // it shouldn't be wrapped in setState() since initState() executes before
    activeScreen = StartScreen(switchScreen);

    // super.initState() makes sure that in the parent class (State<Quiz>) initState() is executed as well
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);

      differentActiveScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        differentActiveScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidget = differentActiveScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestionsScreen(onSelectAnswer: chooseAnswer);

    // instead of using a ternary expression, we can use an if statement
    Widget differentScreenWidget = StartScreen(switchScreen);

    if (differentActiveScreen == 'questions-screen') {
      differentScreenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (differentActiveScreen == 'results-screen') {
      differentScreenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 82, 6, 129),
                Color.fromARGB(255, 154, 87, 196),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: differentScreenWidget,
          /*differentActiveScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : QuestionsScreen(
                  onSelectAnswer:
                      chooseAnswer),*/ //screenWidget, //activeScreen,
        ),
      ),
    );
  }
}

// _className <=> private class (it can only be used in the file it was created in)

// widgets can be stored inside variables since widgets are objects in Dart (for example var activeScreen = StartScreen();)

// we can output different widgets by storing different widgets in a variable
// the variable that holds the widget should be changed in setState() since this will re-execute the build() method and update the rendered the UI according to the changes

// lifting the state up <=> whenever we have a situation where the button / control that should trigger the state change is in one widget and the widget that should be affected by that state change is another widget (we have multiple widgets that essentially need to work with the same state)
// the widget that should initiate the state change should get access to the state changing function defined in the parent widget
// functions in Dart can be used as values so they can be passed to other functions
// we can pass a pointer to the state changing function defined in the parent widget to the child widget when we instantion an object (for example const StartScreen(switchScreen))
// we'll execute the function in the other widget when we need it (for example onPressed: () {startQuiz();})

// the error the instance member 'switchScreen' can't be accessed in an initializer happens because both the variable and method creation happens at the same time, when the class is instantiated
// the solution for this error is to use the initState() method
// initState() <=> method that we typically want to add to our state classes to do some extra initialization work when that state object is created for the first time (it'll execute once, after the object is created)

// another solution for rendering content conditionally is by storing some identifier for a screen in a variable
// ternary expression (condition ? conditionTrueValue : conditionFalseValue) <=> it allows us to check a condition and yield one value, if the condition is met and an alternative value, otherwise
// using this way solution saves us of having to use initState()

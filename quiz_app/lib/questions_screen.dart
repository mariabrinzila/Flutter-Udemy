import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;

  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    setState(() {
      widget.onSelectAnswer(selectedAnswer);

      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(
          40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 237, 187, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(
                answerText: item,
                onTap: () {
                  answerQuestion(item);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

// double.infinity <=> a special value that tells Dart to use as much width as possible (be as wide as possible)
// padding <=> the internal spacing between the content and the borders
// margin <=> the space between adjacent widgets

// mainAxisAlignment: MainAxisAlignment.center <=> center the children of a Column widget vertically
// the main axis for a Column widget is the vertical axis and for a Row widget, the horizontal axis
// using a SizedBox widget with the main axis settings is an alternative to wrapping the content with the Center widget like before (to fill the entire Column / Row width / height)

// the cross axis for a Column widget is the horizontal axis and for a Row widget, the vertical axis
// CrossAxisAlignment.stretch <=> the items inside a Column / Row will stretch out to be as wide / long as possible

// textAlign: TextAlign.center <=> center a Text widget horizontally

// we can map a list of objects to a widgets by using the map() method
// listName.map() <=> a list function that allows us to map the items of a list to a new list of items
// map() receives a function that will be automatically executed by Dart for every list item
// Dart will also automatically pass the current list item for which it'll apply the function as an argument to the function
// the map() conversion doesn't change the original list, in the end this method yields a new list of the mapped items
// map() returns the list of mapped items

// since we don't need a list of AnswerButton widgets after the map() function is executed, we need to spread the returned list of widgets into individual values
// ...listName <=> an operator that allows us to spread the list items in listName into individual items (it'll take all the items in an Iterable object and pull them out of the list and place them as , separated items in the place where we're using it)

// widget.propertyOrMethodName <=> a State<T> function that allows us to pass properties between StatefulWidget and the corresponding State<T> (it gives access to the Widget class and its properties and methods)

// if we have to execute a function that receives arguments when we press a button, we can pass to onPressed an anonymous function that executes the function (for example () { functionName(arguments) })

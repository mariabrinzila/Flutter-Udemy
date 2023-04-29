import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;

  const ResultsScreen({super.key, required this.chosenAnswers});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberTotalQuestions = questions.length;
    final numberCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(
          40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numberCorrectQuestions out of $numberTotalQuestions questions correctly!',
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
              summaryData,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Restart Quiz!',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Map <=> a collection of key - value pairs (for example var user = { 'username': 'Maria', 'password': '123', 'age': 23 })
// if for a generic type we can have multiple types, it's a best practice to use Object since all values in Dart are in the end objects

// iterable.where() <=> a function that allows us to filter an Iterable (List, Map etc.)
// where() receives as an argument a function which will be executed for every item in that Iterable, just like for map()
// where() doesn't change the Iterable, it creates a new one
// in the argument function, we should return true, if the item should be kept in the new Iterable and false, otherwise

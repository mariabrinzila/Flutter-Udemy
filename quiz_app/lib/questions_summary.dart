import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Text(
                    ((data['question_index'] as int) + 1).toString(),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          data['question'] as String,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                        ),
                        Text(
                          data['correct_answer'] as String,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

// mapName['keyValue'] <=> access a value in a Map

// variable as type <=> cast a variable to a specific type (for example data['question_index'] as int)

// without Expanded, Column takes an infinite amount of width, even if it goes beyond the limits of the screen
// Expanded <=> a widget that allows its child to take the available space along the flex widget's main axis
// flex widget <=> the Row / Column widget above the widget that we put in Expanded
// Expanded restricts the width of its child to the width of the flex widget

// SingleChildScrollView <=> a widget that takes a single child and it makes that child scrollable

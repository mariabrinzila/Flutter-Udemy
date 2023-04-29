import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final void Function() onTap;

  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 71, 4, 83),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}

// we only defined the ElevatedButton widget once with the propert styling and we can use it as many times as we want
// EdgeInsets.symmetric() <=> allows us to put different padding on the horizontal and vertical line
// EdgeInsets.all() <=> allows us to put the same padding on all directions (top, bottom, left, right)

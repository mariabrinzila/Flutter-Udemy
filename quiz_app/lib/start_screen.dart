import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;

  // startQuiz should be a function with a return type of void
  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    // Center by default takes up all the space on the screen
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(136, 255, 255, 255),
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 187, 255),
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
            ),
            label: const Text(
              'Start Quiz',
            ),
          )
        ],
      ),
    );
  }
}

// OutlinedButton.icon() <=> OutlineButton constructor that allows the creation of an outlined button with an icon
// the Icon widget can be used in icon buttons and outside them

// in order to tweak the transparency of an image, we can wrap it in the Opacity widget (for example Opacity(opacity: 0.5, child: Image.asset(imgPath)))
// wrapping an Image widget in the Opacity widget isn't really recommended since it's performance intensive
// another approach to setting the transparency is with using the colors named parameter (this parameter can be used to add a color overlay on top of an image)
// we can pass to the colors named parameter a white color and tweak the transparency manually (the slider before the color slider)

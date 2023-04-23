import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Color.fromARGB(255, 221, 196, 247),
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {},
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

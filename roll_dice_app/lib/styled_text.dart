import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;

  const StyledText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // style the color and font of the text
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }
}

// const className(type argName) : propName = argName; <=> set a class property with the argument received in the constructor
// const className(this.propName); <=> a shortcut to set a class property with the argument received in the constructor (Dart looks for a class property with the same name as the one after this.)
// if we receive some data in the constructor, the widget and the constructors aren't constant anymore

// not a widget, a data model
class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);

    shuffledList.shuffle();

    return shuffledList;
  }
}

// List.of(listName) <=> a constructor function that creates a new list based on another list (it basically copies an existing list into a new list)

// listName.shuffle() <=> a list function that allows us to shuffle the list items (change the order of the list items)
// unlike map(), shuffle() changes the original list
// shuffle() doesn't return the shuffled list, it just shuffles the list

// final only makes sure we can't re-assign the variable, not that the current list can't change

class QuizQuestion  //contains blueprint for the Questions and answers
{
  const QuizQuestion(this.text,this.answers);  //passing this as ctor args coz we could now reuse these variables.ie by questions.dart

  final String text;              // ie for each text we've a list of answers.
  final List<String> answers;

  List<String> getShuffledAnswers()
  {
    final shuffledList=List.of(answers);  //basically copies
    shuffledList.shuffle();
    return shuffledList;
  }
}
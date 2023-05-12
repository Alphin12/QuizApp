import 'package:flutter/material.dart';  

class QuestionIdentifier extends StatelessWidget {  //this file is basically to style the question index as green if its correct answer
  const QuestionIdentifier({                           // & red if its a wrong answer -> the index inside circle stuff in result screen.
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ?const Color.fromARGB(255, 6, 244, 89)     //correct answer => green else red (using ternary operator)
            :const Color.fromARGB(255, 186, 1, 1),
        borderRadius: BorderRadius.circular(100),         //used to get that circular shape
      ),
      child: Text(
        questionNumber.toString(),           //type casting to string
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});  //chooseAnswer() is recieved here.
  final void Function(String answer) onSelectAnswer;                   

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswers) //executes when one of the answer button is pressed
  {
    widget.onSelectAnswer(selectedAnswers); //'widget.'=to use onSelectAnswer in this State class from the abv widget class
    // the pressed answer is passed to the onSelectAnswer fn which passes to chooseAnswer() in quiz.dart where we store this answer.
    setState(() {
      currentQuestionIndex++; //used to access next qn from list
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex]; //accessing questions in questions.dart using list questions.

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40), //to give margin bw screen& button
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //centers QnA to center of screen instead of top
          crossAxisAlignment: CrossAxisAlignment.stretch, // to stretch it horizontally
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                //lato is the font
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, //aligns the qstn to center
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              //mapping List of answers to buttons
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);   //passes the answer we pressed to the fn abv.
                  });
            }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget 
{
  const ResultScreen({super.key, required this.chosenAnswers,required this.onRestart});
  final List<String> chosenAnswers;
  final void Function() onRestart;           //fn recieved from quiz.dart 

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question-index': i,
        'question': questions[i].text,
        'correct-answer': questions[i].answers[0],   //coz 1st ans is correct ans so index=0 for each ith qstn
        'user-answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {           //.where returns a new list based on a condition.
      return data['user-answer'] == data['correct-answer'];
    }).length;                                                     //ie we want the length of this new list

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40), //to give margin bw screen& button
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
               style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ), //gfonts
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
             QuestionsSummary(summaryData),
              const SizedBox(height: 30),
               TextButton.icon(
                   onPressed: onRestart,
                   style: TextButton.styleFrom(
                      foregroundColor: Colors.white),
                   icon: const Icon(Icons.refresh),
                   label: const Text('Restart Quiz',style: TextStyle(fontSize: 20),),
               )
          ],
        ),
      ),
    );
  }
}

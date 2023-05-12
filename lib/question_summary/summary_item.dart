import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quizapp/question_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {   //This file displays the questions & answers in result screen & the styling for them
  const SummaryItem(this.itemData, {super.key});    //All this items in this file are wrapped by scrolling & other widgets(in question_summary.dart)

  final Map<String,Object> itemData;

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer =                 // this var is true if they are equal, its passed to another cls below where its used.
        itemData['user-answer'] == itemData['correct-answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(    // uniform padding above & below
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(                      //passing if an answer is correct or not to QuestionIdentifier where its styled based on this. ie Green if true else Red
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question-index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,        // displays the Questions in the result screen
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(itemData['user-answer'] as String,          //displays the user answer in result screen
                    style: const TextStyle(
                      color: Color.fromARGB(255, 202, 171, 252),
                    )),
                Text(itemData['correct-answer'] as String,      //displays the correct answer in result screen
                    style: const TextStyle(
                      color: Color.fromARGB(255, 181, 254, 246),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
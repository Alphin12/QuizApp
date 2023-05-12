import 'package:flutter/material.dart';
import 'package:quizapp/question_summary/summary_item.dart';


class QuestionsSummary extends StatelessWidget  //this file basically is used for displaying the scrollable part in result screen ie 
{                                                 //the questions summary

  const QuestionsSummary(this.summaryData, {super.key});  //recieves List of Maps from result_screen thru getSummaryData()
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(       //to enable scrolling
        child: Column(
          children: summaryData.map(      //children wants a list of widgets. so we use map to convert List of maps to widgets.
            (data) {
              return SummaryItem(data);   //passes the converted List of Maps to SummaryItem class
            },
          ).toList(),
        ),
      ),
    );
  }
}
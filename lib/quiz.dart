import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/result_screen.dart';
import 'package:quizapp/start_screen.dart'; //coz StartScreen() is used here
class Quiz extends StatefulWidget
{
  const Quiz({super.key});      //a ctor fn for this class

  @override
  State<Quiz> createState()         //basically creating an object for the private class.
  {
     return _QuizState();         //creating an instance of the pvt class by calling its ctor.
  }
}

class _QuizState extends State<Quiz>
{                                       //flutter automatically gives a ctor fn so no need to add one
  // Widget? activeScreen; //? means activeScreen could also be null
  // @override
  // void initState() {
  // activeScreen=StartScreen(switchScreen);   //initialize activeScreen with StartScreen() ctor with switchScreen Function passed as arg
  //   super.initState();                      // coz we want to change the page when button is pressed.
  // }
  var activeScreen='start-screen';
  List<String> selectedAnswers=[];  //List tht stores the answers we selected

  void switchScreen()          //when this fn is called setState((){}) invokes build() again with activeScreen's value changed ie diff
  {                            // page rendered each time
    setState(() {
      activeScreen='question-screen';
      // activeScreen=const QuestionsScreen();     //it would update the UI if theres a change .
    });
  }
  void chooseAnswer(String answer)   // ie the pressed answer is passed in here and added to list below.
  {
    selectedAnswers.add(answer);              //adding answers to the list when this fn is executed
    if(selectedAnswers.length==questions.length)  //ie if no of qstns=no of answers , display result screen.
    {
      setState(() {
        activeScreen='results-screen';
      });
    }
  }
  void restartQuiz()           //fn to be executed when we press restart quiz
  {
    setState(() {
      selectedAnswers=[];
      activeScreen='question-screen';
    });
  }

  @override
  Widget build(context)                     
  { 
    Widget screenWidget=StartScreen(switchScreen);
    if(activeScreen=='question-screen')
    {
       screenWidget=QuestionsScreen(onSelectAnswer: chooseAnswer,);  //chooseanswer() is passed to QuestionScreen() recieved by onSelectAnswer()
    }
    if(activeScreen=='results-screen')
    {
      screenWidget=ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz);  //the List of answers is passed to resultscreen.

    }
    return MaterialApp(
      home: Scaffold(
        body:Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors:[
                Color.fromARGB(255, 255, 12, 12),
                Color.fromARGB(255, 40, 29, 255),
            ],
            begin:Alignment.topLeft,
            end:Alignment.bottomRight,

            ),
          ),
          child :screenWidget,      //calls StartScreen() ctor fn initially
          ),
      ),
    );
  }
}
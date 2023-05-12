import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget 
{
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize : MainAxisSize.min,
        children: [
        Image.asset('assets/images/quiz-logo.png',width:300,color:const Color.fromARGB(150, 255, 255, 255)),
        const SizedBox(height:80),
       Text('Solve this Quiz on Flutter !!',
        style: GoogleFonts.mavenPro(
          color:Colors.white,
          fontSize: 24,
        ),
        ),
       const SizedBox(height: 30,),
       OutlinedButton.icon(                    //appended with .icon to make it an icon
         onPressed:startQuiz,            
         style:OutlinedButton.styleFrom(foregroundColor: Colors.white), //changes the texts(below) color inside button to white
         icon:const Icon(Icons.arrow_right_alt),            //this adds a right arrow icon in the button
         label: const Text('Start Quiz')
        ),
      ],
      ),
    );
  }
}

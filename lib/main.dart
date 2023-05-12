import 'package:flutter/material.dart';
import 'package:quizapp/quiz.dart';     //since Quiz() is used here 

void main() {
  runApp(
    const Quiz()    //MaterialApp() still gets executed first as its written in Quiz() so we r just wrapping 
  );
}

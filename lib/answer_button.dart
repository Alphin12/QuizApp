import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget
{
  // AnswerButton(this.answerText,this.onTap,{super.key});  //positional parameters ie optional but we rly require those values

  const AnswerButton({super.key,required this.answerText,required this.onTap}); //named parameters, now both this are required.
  
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context)
  {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
        backgroundColor:const Color.fromARGB(255, 0, 5, 97),       //bgcolor of button
        foregroundColor: Colors.white,                        //text color of button
        shape:RoundedRectangleBorder( borderRadius: BorderRadius.circular(40)), // to change the shape of button
      ),
      child: Text(answerText,textAlign: TextAlign.center),
      );
  }
}
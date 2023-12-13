import 'package:artifitia_interview_task/screens/home_screen/view/home_screen.dart';
import 'package:artifitia_interview_task/screens/quiz_screen/view/quiz_screen.dart';
import 'package:artifitia_interview_task/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatefulWidget {
   ResultScreen({
    required this.percentage, 
    required this.totalQuestions,
    required this.correctAnswers,
     super.key});

  final double percentage;
  final int totalQuestions;
  final int correctAnswers;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>{
   
  bool issubmitNext = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main_bg,
      body: SafeArea(
        child: Column(
          children: [Container(
            padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
            margin: const EdgeInsets.fromLTRB( 30,180,30,30),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white),
            child: Column(
              children: [
                const Image(image:  AssetImage("assets/images/congrats.gif")),
                Text(
              "${widget.percentage}% Score",
              style: GoogleFonts.kanit(
                  fontSize: 25,
                  color: text_color2,
                  fontWeight: FontWeight.w500,
              )
          ),
          Text(
              "Quiz completed successfully..!",
              style: GoogleFonts.kanit(
                color: text_color3,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
              )
          ),
          RichText(text: TextSpan(
            text: "You attempt",
            style: GoogleFonts.kanit(
              color: text_color3,
              fontSize: 14),
          children: <TextSpan>[
            TextSpan(text: "${widget.totalQuestions} Questions",
            style: GoogleFonts.kanit(
              color: text_color4,
              fontSize: 14)
              ),
              TextSpan(text: "and",
              style: GoogleFonts.kanit(
                color: text_color3,
                fontSize: 14)
                ),
              ])),
      
              RichText(text: TextSpan(
            text: "from that",
            style: GoogleFonts.kanit(
              color: text_color3,
              fontSize: 14),
          children: <TextSpan>[
            TextSpan(text: "${widget.correctAnswers} answers",
            style: GoogleFonts.kanit(
              color: text_color5,
              fontSize: 14)
              ),
              TextSpan(text: "is correct.",
              style: GoogleFonts.kanit(
                color: text_color3,
                fontSize: 14)
                ),
              ])),
      
              ],
            ),
          ),
          ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize:const Size(124, 45),
            shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
        
          ),
            primary: issubmitNext?text_color2:text_color5,
            
          ),
          onPressed: () {
           issubmitNext?Get.to(()=> QuizScreen()):Get.to(()=>HomeScreen());
          },
          child: Text(issubmitNext ? "Try again..!" : "Back..!"),
        ),
          ],
        ),
      ),
    );
  }
}
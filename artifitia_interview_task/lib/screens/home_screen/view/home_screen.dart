import 'package:artifitia_interview_task/screens/quiz_screen/view/quiz_screen.dart';
import 'package:artifitia_interview_task/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main_bg,
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30,160,30,0),
            child: Image.asset('assets/images/quiz_icon.png'),
          ),
          InkWell(
            onTap: () => Get.to(()=> const QuizScreen()),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
              decoration: BoxDecoration(
                color: button_color1,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
              "Start Quiz",
              style: GoogleFonts.kanit(
                  fontSize: 18,
                  color: white,
                  fontWeight: FontWeight.w400,
              )
                  ),
            ),
          ),
        const SizedBox(height: 150,),
        Text(
            "powered by",
            style: GoogleFonts.kanit(
                fontSize: 12,
                color: text_color1,
                fontWeight: FontWeight.w400,
            )
        ),
        Text(
            "www.artifitia.com",
            style: GoogleFonts.kanit(
                fontSize: 13,
                color: text_color1,
                fontWeight: FontWeight.w400,
            )
        )
        ],
      )),
    );
  }
}
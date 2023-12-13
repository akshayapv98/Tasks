import 'package:artifitia_interview_task/screens/quiz_screen/controller/quiz_controller.dart';
import 'package:artifitia_interview_task/screens/quiz_screen/model/quiz_model.dart';
import 'package:artifitia_interview_task/utils/colors.dart';
import 'package:artifitia_interview_task/widgets/showSubmitScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int correctAnswers = 0;
  int totalQuestions = 0;
  int? selectedOptionIndex;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main_bg,
      body: GetBuilder<QuizController>(
        init: QuizController(),
        builder: (controller) {
          return SafeArea(child: controller.isLoading?const Center(
            child: SpinKitFadingCircle(color: white,size: 30,),
          ):
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
                  child: LinearPercentIndicator(
                  linearStrokeCap: LinearStrokeCap.round,
                  curve: Curves.linear,
                  lineHeight: 27,
                  percent: (currentIndex + 1) /
                                controller.quizList.length,
                  progressColor: progress_color2,
                  backgroundColor: progress_color1,
                  
                            ),
                ),
               Container(
                padding:  EdgeInsets.symmetric(horizontal: 15,vertical: MediaQuery.of(context).size.height*0.1),
                 child: Column(
                  
                   children: [
                     Text(
                        controller.quizList[currentIndex].question.toString(),
                        style: GoogleFonts.kanit(
                          color: white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                        )
                       ),
                       ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.quizList[currentIndex].options!.length,
                        itemBuilder: (context,index){
                          QuizModel quiz = controller.quizList[currentIndex];
                          Option option = quiz.options![index];

                          Color optionColor = _getOptionColor(index);
                          return GestureDetector(
                            onTap: () {
                                      setState(() {
                                        selectedOptionIndex = index;
                                      });
                                    },
                            child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                             margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                             decoration: BoxDecoration(
                              color: optionColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: white,width: 1)
                             ),
                             child: Row(
                                 children: [Text(
                                   "${index + 1}..",
                                   style: GoogleFonts.kanit(
                                       fontSize: 18,
                                       color: white,
                                       fontWeight: FontWeight.w400,
                                   ),
                               ),
                               const SizedBox(width: 10,),
                               Text(option.text.toString(),
                                   style: GoogleFonts.kanit(
                                       fontSize: 18,
                                       color: white,
                                       fontWeight: FontWeight.w300,
                                   )
                               )
                               ],),
                                                  
                                                   ),
                          );
                       }),
                       InkWell(
            onTap: () {
              _nextQuestion();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
              "Next",
              style: GoogleFonts.kanit(
                  fontSize: 18,
                  color: main_bg,
                  fontWeight: FontWeight.w400,
              )
                  ),
            ),
          ),
                   ],
                 ),
               )
              
              ],
            ),
          ));
        }
      ),
    );
  }
   Color _getOptionColor(int index) {
    if (selectedOptionIndex != null) {
      QuizModel quiz = Get.find<QuizController>().quizList[currentIndex];
      Option selectedOption = quiz.options![selectedOptionIndex!];
      if (index == selectedOptionIndex && selectedOption.isCorrect == true) {
        return Colors.green; 
      } else if (index == selectedOptionIndex && selectedOption.isCorrect == false) {
        return Colors.red; 
      } else {
        return main_bg; 
      }
    } else {
      return main_bg;
    }
  }

   void _checkAnswer() {
    if (selectedOptionIndex != null) {
      QuizModel quiz = Get.find<QuizController>().quizList[currentIndex];
      Option selectedOption = quiz.options![selectedOptionIndex!];
      if (selectedOption.isCorrect == true) {
        correctAnswers++;
      }
    }
  }
  void _nextQuestion() {
    _checkAnswer();
    setState(() {
      currentIndex++;
      selectedOptionIndex = null;
    });

    totalQuestions = Get.find<QuizController>().quizList.length;

    if (currentIndex == totalQuestions) {
      double percentage =
          (correctAnswers / totalQuestions) * 100; 
      

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            percentage: percentage,
            totalQuestions: totalQuestions,
            correctAnswers: correctAnswers,
          ),
        ),
      );
    }
  }
}

 

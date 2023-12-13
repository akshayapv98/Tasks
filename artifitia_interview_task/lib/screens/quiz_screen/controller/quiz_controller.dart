import 'dart:convert';

import 'package:artifitia_interview_task/screens/quiz_screen/model/quiz_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class QuizController extends GetxController{
  QuizModel quizModel=QuizModel();
  bool isLoading =false;
  List<Option> options=[];
  List<QuizModel> quizList = [];
  

  @override
  void onInit() {
    super.onInit();
    getQuiz();
    isLoading=true;
    update();
  }
  

getQuiz() async {
    Uri url = Uri.parse("https://nice-lime-hippo-wear.cyclic.app/api/v1/quiz");
    var response = await http.get(url);
    isLoading = false;
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      if (data is List) {
       
        for (var quizData in data) {
         
          QuizModel quiz = QuizModel.fromJson(quizData);
          quizList.add(quiz);
        }
      } else {
        print('Unexpected data format');
      }
    }

    update();
  }
}

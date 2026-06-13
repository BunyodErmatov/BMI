import 'package:quiz_app_bmi/models/question_model.dart';

void main() {
  final allStrings = <String>{};

  void extract(List<QuestionModel> lst) {
    for (var q in lst) {
      allStrings.add(q.askQuestion);
      allStrings.addAll(q.askOptions);
    }
  }

  extract(mathQuestions);
  extract(codingQuestions);
  // englishQuestions, historyQuestions, physicsQuestions ni ham qaramiz
  // ammo model importida bo'lmasa ishlamaydi. Let's just collect all strings and see missing
}

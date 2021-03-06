import 'package:first_app/models/abstract/task.dart';

class TheoryTask extends Task {
  final String question;
  final List<String> variants;
  final String answer;

  TheoryTask({this.question, this.variants, this.answer})
      : super(question: question, answer: answer);

  factory TheoryTask.fromJson(Map<String, dynamic> json) {
    var variants = json['variants'];
    List<String> result = new List<String>();
    for (var i = 0; i < variants.length; i++) {
      result.add(variants[i].toString());
    }
    return new TheoryTask(
      question: json['question'] as String,
      variants: result,
      answer: json['answer'] as String,
    );
  }
}

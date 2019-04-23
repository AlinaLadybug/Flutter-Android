import 'package:first_app/models/abstract/task.dart';

class PracticalTask extends Task {
  final String question;
  final String answer;

  PracticalTask({this.question, this.answer})
      : super(question: question, answer: answer);

  factory PracticalTask.fromJson(Map<String, dynamic> json) {
    return new PracticalTask(
      question: json['question'] as String,
      answer: json['answer'] as String,
    );
  }
}

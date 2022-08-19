import 'package:equatable/equatable.dart';

class QuestionModel extends Equatable {
  const QuestionModel({required this.question, this.answer = 2});
  final String question;
  final int answer;

  @override
  List<Object?> get props => [question, answer];
}

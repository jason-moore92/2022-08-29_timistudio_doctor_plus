import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  const ReviewModel(
      {required this.id,
      required this.avt,
      required this.date,
      required this.name,
      required this.rate,
      required this.review});
  final int id;
  final String avt;
  final String name;
  final double rate;
  final String review;
  final DateTime date;

  @override
  List<Object?> get props => [id, avt, name, rate, review, date];
}

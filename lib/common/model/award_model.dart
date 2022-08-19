import 'package:equatable/equatable.dart';

class AwardModel extends Equatable {
  const AwardModel({this.nameAward, this.year, this.photo});
  final String? nameAward;
  final String? year;
  final String? photo;

  @override
  List<Object?> get props => [nameAward, year, photo];
}

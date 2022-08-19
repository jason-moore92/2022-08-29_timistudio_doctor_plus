import 'package:equatable/equatable.dart';

class EducationModel extends Equatable {
  const EducationModel(
      {this.medicalSchool, this.educated, this.degree, this.year});
  final String? medicalSchool;
  final String? educated;
  final String? degree;
  final String? year;
  @override
  List<Object?> get props => [medicalSchool, educated, degree, year];
}

import 'package:equatable/equatable.dart';

class CertificationModel extends Equatable {
  const CertificationModel({this.nameCertification, this.year, this.photo});
  final String? nameCertification;
  final String? year;
  final String? photo;

  @override
  List<Object?> get props => [nameCertification, year, photo];
}

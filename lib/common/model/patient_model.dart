import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';

class PatientModel extends Equatable {
  const PatientModel({
    required this.name,
    this.avatar = icAccount,
    required this.dateOfBirth,
    this.phone,
    this.age,
    this.place,
    this.height,
    this.weight,
    this.bmi,
    this.bloodType,
    required this.isMale,
  });
  final String name;
  final int? age;
  final String? place;
  final double? height;
  final double? weight;
  final double? bmi;
  final String? bloodType;
  final String avatar;
  final DateTime dateOfBirth;
  final String? phone;
  final bool isMale;

  @override
  List<Object?> get props => [
        name,
        age,
        place,
        height,
        weight,
        bmi,
        bloodType,
        avatar,
        dateOfBirth,
        phone,
        isMale
      ];
}

import 'package:equatable/equatable.dart';

import 'education_model.dart';

class DoctorModel extends Equatable {
  const DoctorModel(
      {required this.avt,
      required this.id,
      required this.name,
      this.specialities,
      required this.place,
      required this.reviews,
      required this.rate,
      this.isMyNetwork = true,
      this.isOnline = true,
      this.savedLives = 0,
      this.patients = 0,
      this.thanksFor = 0,
      this.helpedPeople = 0,
      this.insurance,
      this.aboutMe,
      this.phone,
      this.experience,
      this.education,
      this.certiAward});
  final int id;
  final String avt;
  final String name;
  final double rate;
  final int reviews;
  final String place;
  final bool isMyNetwork;
  final bool isOnline;
  final int patients;
  final int savedLives;
  final int helpedPeople;
  final int thanksFor;
  final String? phone;
  final String? aboutMe;
  final List<String>? insurance;
  final List<SpecialityModel>? specialities;
  final List<ExperienceModel>? experience;
  final List<EducationModel>? education;
  final List<CertiAwardModel>? certiAward;

  @override
  List<Object?> get props => [
        id,
        avt,
        name,
        specialities,
        rate,
        reviews,
        place,
        isMyNetwork,
        isOnline,
        patients,
        savedLives,
        helpedPeople,
        thanksFor,
        specialities,
        aboutMe,
        insurance,
        phone,
        experience,
        education,
        certiAward
      ];
}

class SpecialityModel extends Equatable {
  const SpecialityModel({this.icon, required this.nameSpec});
  final String? icon;
  final String nameSpec;

  @override
  List<Object?> get props => [icon, nameSpec];
}

class ExperienceModel extends Equatable {
  const ExperienceModel({required this.title, required this.answer});
  final String title;
  final String answer;

  @override
  List<Object?> get props => [title, answer];
}

class CertiAwardModel extends Equatable {
  const CertiAwardModel({required this.title, required this.time});
  final String title;
  final String time;

  @override
  List<Object?> get props => [title, time];
}

import 'package:equatable/equatable.dart';

class HospitalModel extends Equatable {
  const HospitalModel(
      {this.name,
      this.address,
      this.insurances,
      this.phoneNumber,
      this.imageHospital,
      this.imageBackground,
      this.rate,
      this.reviews,
      this.distance,
      this.beds});
  final String? imageHospital;
  final String? imageBackground;
  final String? name;
  final String? address;
  final String? phoneNumber;
  final List<String>? insurances;
  final double? rate;
  final int? reviews;
  final int? beds;
  final double? distance;

  @override
  List<Object?> get props => [
        name,
        address,
        phoneNumber,
        imageBackground,
        insurances,
        imageHospital,
        rate,
        reviews,
        beds,
        distance
      ];
}

import 'package:equatable/equatable.dart';

class LicenseModel extends Equatable {
  const LicenseModel(
      {this.county,
      this.ofState,
      this.number,
      this.npiNumber,
      this.photo,
      this.expiration});
  final String? county;
  final String? ofState;
  final String? number;
  final String? npiNumber;
  final String? photo;
  final String? expiration;

  @override
  List<Object?> get props =>
      [county, ofState, number, npiNumber, photo, expiration];
}

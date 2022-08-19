import 'package:equatable/equatable.dart';

enum AccountType { checking, savings }

class BankModel extends Equatable {
  const BankModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.accountType,
      required this.rountingNumber,
      required this.accountNumber});
  final int id;
  final String firstName;
  final String lastName;
  final AccountType accountType;
  final String accountNumber;
  final String rountingNumber;

  @override
  List<Object?> get props =>
      [id, firstName, lastName, accountType, accountNumber, rountingNumber];
}

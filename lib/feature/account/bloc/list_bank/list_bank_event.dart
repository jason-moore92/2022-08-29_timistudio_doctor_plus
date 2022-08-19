import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/bank_model.dart';

abstract class ListBankEvent extends Equatable {
  const ListBankEvent();
}

class InitialBankEvent extends ListBankEvent {
  @override
  List<Object> get props => [];
}

class AddBankEvent extends ListBankEvent {
  const AddBankEvent({required this.bank});
  final BankModel bank;
  @override
  List<Object> get props => [bank];
}

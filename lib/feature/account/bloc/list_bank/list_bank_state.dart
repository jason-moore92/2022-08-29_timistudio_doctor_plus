import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/model/bank_model.dart';

abstract class ListBankState extends Equatable {
  const ListBankState();
}

class ListBankInitial extends ListBankState {
  @override
  List<Object> get props => [];
}

class ListBankLoading extends ListBankState {
  @override
  List<Object> get props => [];
}

class ListBankSuccess extends ListBankState {
  const ListBankSuccess({required this.banks});
  final List<BankModel> banks;
  @override
  List<Object> get props => [banks];
}

class ListBankFailure extends ListBankState {
  const ListBankFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/model/bank_model.dart';

import 'bloc_list_bank.dart';

class ListBankBloc extends Bloc<ListBankEvent, ListBankState> {
  ListBankBloc() : super(ListBankInitial()) {
    on<InitialBankEvent>((event, emit) async {
      try {
        emit(ListBankLoading());
        banks.clear();
        emit(ListBankSuccess(banks: banks));
      } catch (e) {
        emit(ListBankFailure(error: e.toString()));
      }
    });
    on<AddBankEvent>((event, emit) async {
      try {
        emit(ListBankLoading());
        banks.add(event.bank);
        emit(ListBankSuccess(banks: banks));
      } catch (e) {
        emit(ListBankFailure(error: e.toString()));
      }
    });
  }

  List<BankModel> banks = [];
}

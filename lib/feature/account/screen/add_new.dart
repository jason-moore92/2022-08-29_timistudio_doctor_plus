import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/model/bank_model.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import '../bloc/list_bank/bloc_list_bank.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class AddNew extends StatefulWidget {
  const AddNew({Key? key}) : super(key: key);

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  TextEditingController firstNameCtl = TextEditingController();
  FocusNode firstNameFn = FocusNode();
  TextEditingController lastNameCtl = TextEditingController();
  FocusNode lastNameFn = FocusNode();
  TextEditingController accountNumberCtl = TextEditingController();
  FocusNode accountNumberFn = FocusNode();
  TextEditingController rountingNumberCtl = TextEditingController();
  FocusNode rountingNumberFn = FocusNode();
  bool saving = false;
  bool checking = true;
  bool accept = true;
  late ListBankBloc listBankBloc;

  @override
  void didChangeDependencies() {
    listBankBloc = BlocProvider.of<ListBankBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    firstNameCtl.dispose();
    lastNameCtl.dispose();
    lastNameFn.dispose();
    firstNameFn.dispose();
    accountNumberCtl.dispose();
    accountNumberFn.dispose();
    rountingNumberCtl.dispose();
    rountingNumberFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        right: AnimationClick(
          function: () {
            listBankBloc.add(AddBankEvent(
                bank: BankModel(
                    id: listBankBloc.banks.length,
                    firstName: firstNameCtl.text.trim(),
                    lastName: lastNameCtl.text.trim(),
                    accountType:
                        checking ? AccountType.checking : AccountType.savings,
                    rountingNumber: rountingNumberCtl.text.trim(),
                    accountNumber: accountNumberCtl.text.trim())));
            Navigator.of(context).pop();
          },
          child: Text(
            LocaleKeys.add.tr(),
            style: h5(color: dodgerBlue, fontWeight: '700'),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            LocaleKeys.addBankAccount.tr(),
            style: h1(context: context, fontWeight: '700'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 24),
            child: Text(
              LocaleKeys.securelyEnter.tr(),
              style: h6(context: context),
            ),
          ),
          TextFieldCpn(
            controller: firstNameCtl,
            focusNode: firstNameFn,
            focusNext: lastNameFn,
            labelText: LocaleKeys.firstName.tr(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: TextFieldCpn(
              controller: lastNameCtl,
              focusNode: lastNameFn,
              labelText: LocaleKeys.lastName.tr(),
            ),
          ),
          Text(
            LocaleKeys.accountType.tr(),
            style: h6(context: context),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: checking,
                        activeColor: tiffanyBlue,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: dodgerBlue),
                            borderRadius: BorderRadius.circular(4)),
                        onChanged: (value) {
                          setState(() {
                            checking = true;
                            saving = false;
                          });
                        }),
                    Text(
                      LocaleKeys.checking.tr(),
                      style: h6(context: context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: saving,
                        activeColor: tiffanyBlue,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: dodgerBlue),
                            borderRadius: BorderRadius.circular(4)),
                        onChanged: (value) {
                          setState(() {
                            checking = false;
                            saving = true;
                          });
                        }),
                    Text(
                      LocaleKeys.savings.tr(),
                      style: h6(context: context),
                    ),
                  ],
                )
              ],
            ),
          ),
          TextFieldCpn(
            controller: accountNumberCtl,
            focusNode: accountNumberFn,
            focusNext: rountingNumberFn,
            suffixIcon: icHelpWhite,
            showSuffixIcon: true,
            colorSuffixIcon: dodgerBlue,
            labelText: LocaleKeys.accountNumber.tr(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: TextFieldCpn(
              controller: rountingNumberCtl,
              focusNode: rountingNumberFn,
              suffixIcon: icHelpWhite,
              showSuffixIcon: true,
              colorSuffixIcon: dodgerBlue,
              labelText: LocaleKeys.rountingNumber.tr(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                    value: accept,
                    activeColor: tiffanyBlue,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: dodgerBlue),
                        borderRadius: BorderRadius.circular(4)),
                    onChanged: (value) {
                      setState(() {
                        accept = value!;
                      });
                    }),
                Expanded(
                  child: Text(
                    LocaleKeys.understandAndAccept.tr(),
                    style: h6(context: context),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/model/bank_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/account/bloc/list_bank/bloc_list_bank.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BankDeposit extends StatelessWidget {
  const BankDeposit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BankModel> banks = [];
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        right: IconButtonCpn(
            function: () {
              Navigator.of(context).pushNamed(Routes.addNew);
            },
            iconColor: dodgerBlue,
            borderColor: dodgerBlue,
            path: icPlus),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.bankDeposit.tr(),
              style: h1(context: context, fontWeight: '700'),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: BlocBuilder<ListBankBloc, ListBankState>(
                builder: (context, state) {
                  if (state is ListBankSuccess) {
                    banks = state.banks;
                  }
                  return banks.isNotEmpty
                      ? ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 24);
                          },
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: banks.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Slidable(
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {},
                                      backgroundColor: neonFuchsia,
                                      foregroundColor: grey100,
                                      label: 'Delete',
                                    ),
                                    SlidableAction(
                                      onPressed: (context) {},
                                      backgroundColor: dodgerBlue,
                                      foregroundColor: grey100,
                                      label: LocaleKeys.edit.tr(),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: grey100,
                                      boxShadow: [
                                        BoxShadow(
                                            color: color4.withOpacity(0.04),
                                            offset: const Offset(0, 5),
                                            blurRadius: 10)
                                      ]),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          value: true,
                                          activeColor: tiffanyBlue,
                                          shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: dodgerBlue),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          onChanged: (value) {}),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                banks[index].firstName +
                                                    banks[index].lastName,
                                                style: h5(
                                                    context: context,
                                                    fontWeight: '700'),
                                              ),
                                              Text(
                                                banks[index].accountNumber,
                                                style: h7(context: context),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ImageAsset(
                              imgEmptyBank,
                              width: 160,
                              height: height / 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 56, bottom: 32),
                              child: Text(
                                LocaleKeys.noAccount.tr(),
                                style: h3(context: context, fontWeight: '700'),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: ElevatedCpn(
                                function: () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.addNew);
                                },
                                gradient: linear,
                                leftWidget:
                                    const ImageAsset(icPayment, color: grey100),
                                textButton: LocaleKeys.addNewBankAccount.tr(),
                                textStyle: h5(
                                    color: Theme.of(context).color12,
                                    fontWeight: '700'),
                              ),
                            )
                          ],
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

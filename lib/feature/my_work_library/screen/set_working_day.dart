import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/have_consult.dart';
import '../bloc/working_day/bloc_working_day.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SetWorkingDay extends StatefulWidget {
  const SetWorkingDay({Key? key, required this.dayWork}) : super(key: key);
  final List<String> dayWork;

  @override
  State<SetWorkingDay> createState() => _SetWorkingDayState();
}

class _SetWorkingDayState extends State<SetWorkingDay> {
  bool includeHoliday = true;
  List<Map<String, dynamic>> workingDay = [];
  late WorkingDayBloc workingDayBloc;

  @override
  void didChangeDependencies() {
    workingDayBloc = BlocProvider.of<WorkingDayBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCpn(
        iconLeft: close,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: ElevatedCpn(
          function: () {
            Navigator.of(context).pushNamed(Routes.setWorkingTime);
          },
          rightWidget: const Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 24,
            color: grey100,
          ),
          gradient: linear,
          textButton: LocaleKeys.setWorkingTime.tr(),
          textStyle: h5(color: Theme.of(context).color12, fontWeight: '700'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          Text(
            'Step 1 of 2',
            style: h7(context: context, fontWeight: '700'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 40),
            child: Text(
              LocaleKeys.settingWorkingDay.tr(),
              style: h1(context: context, fontWeight: '700'),
            ),
          ),
          Text(
            'Working Day',
            style: h7(context: context, fontWeight: '700'),
          ),
          Container(
            alignment: Alignment.center,
            height: 40,
            margin: const EdgeInsets.only(top: 32, bottom: 40),
            child: BlocBuilder<WorkingDayBloc, WorkingDayState>(
              builder: (context, state) {
                if (state is WorkingDaySuccess) {
                  workingDay = state.workingDay;
                }
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 8);
                  },
                  shrinkWrap: true,
                  itemCount: workingDay.length,
                  itemBuilder: (context, index) {
                    return AnimationClick(
                      function: () {
                        workingDayBloc.add(EditWorkingDayEvent(index: index));
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: workingDay[index]['selected']
                                ? dodgerBlue
                                : backgroundColor),
                        child: Text(
                          workingDay[index]['time'],
                          style: h2(
                              fontWeight: '600',
                              color: workingDay[index]['selected']
                                  ? grey100
                                  : grayBlue),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              children: [
                BlocBuilder<WorkingDayBloc, WorkingDayState>(
                  builder: (context, state) {
                    if (state is WorkingDaySuccess) {
                      includeHoliday = state.includeHoliday;
                    }
                    return Checkbox(
                        value: includeHoliday,
                        activeColor: tiffanyBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        onChanged: (value) {
                          workingDayBloc
                              .add(ChangeHolidaysEvent(changeHoliday: value!));
                        });
                  },
                ),
                Text(
                  LocaleKeys.includedHolidays.tr(),
                  style: h6(context: context),
                )
              ],
            ),
          ),
          HaveConsult(
            title: LocaleKeys.applyPlan.tr(),
            isSetWorkingDay: true,
          )
        ],
      ),
    );
  }
}

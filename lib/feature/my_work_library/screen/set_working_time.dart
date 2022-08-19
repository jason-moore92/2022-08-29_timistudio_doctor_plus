import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/model/working_time_model.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/outlined_cpn.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/bloc/working_time/working_time_bloc.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/bloc/working_time/working_time_event.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/bloc/working_time/working_time_state.dart';
import '../widget/select_time_range.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SetWorkingTime extends StatefulWidget {
  const SetWorkingTime({Key? key}) : super(key: key);
  @override
  State<SetWorkingTime> createState() => _SetWorkingTimeState();
}

class _SetWorkingTimeState extends State<SetWorkingTime> {
  List<WorkingTimeModel> workingTime = [];
  TextEditingController fromCtl = TextEditingController();
  TextEditingController toCtl = TextEditingController();
  late WorkingTimeBloc workingTimeBloc;

  @override
  void didChangeDependencies() {
    workingTimeBloc = BlocProvider.of<WorkingTimeBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    fromCtl.dispose();
    toCtl.dispose();
    super.dispose();
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
            if (fromCtl.text.isNotEmpty && toCtl.text.isNotEmpty) {
              workingTimeBloc.add(AddWorkingTimeEvent(
                  index: workingTimeBloc.workingTime.length,
                  fromDate: fromCtl.text,
                  toDate: toCtl.text));
            }
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          gradient: linear,
          textButton: LocaleKeys.saveSettings.tr(),
          textStyle: h5(color: Theme.of(context).color12, fontWeight: '700'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          Text(
            'Step 2 of 2',
            style: h7(context: context, fontWeight: '700'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 40),
            child: Text(
              LocaleKeys.setWorkingTime.tr(),
              style: h1(context: context, fontWeight: '700'),
            ),
          ),
          BlocBuilder<WorkingTimeBloc, WorkingTimeState>(
            builder: (context, state) {
              if (state is WorkingTimeSuccess) {
                workingTime = state.workingTime;
              }
              return ListView.separated(
                padding: const EdgeInsets.only(bottom: 32),
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 32);
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: workingTime.length,
                itemBuilder: (context, index) {
                  return SelectTimeRange(
                      fromCtl: fromCtl, toCtl: toCtl, index: index);
                },
              );
            },
          ),
          OutlinedCpn(
            function: () {
              workingTimeBloc.add(AddWorkingTimeEvent(
                  index: workingTimeBloc.workingTime.length,
                  fromDate: TimeOfDay.now().format(context),
                  toDate: TimeOfDay.now().format(context)));
            },
            leftWidget: const Icon(Icons.add, size: 24, color: dodgerBlue),
            textButton: LocaleKeys.addAvailableTime.tr(),
            textStyle: h5(color: grayBlue, fontWeight: '700'),
          )
        ],
      ),
    );
  }
}

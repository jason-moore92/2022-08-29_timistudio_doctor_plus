import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/util/format_time.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/bloc/working_day/bloc_working_day.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

import 'text_field/textfield.dart';

class HaveConsult extends StatefulWidget {
  const HaveConsult({Key? key, this.title, this.isSetWorkingDay = false})
      : super(key: key);
  final String? title;
  final bool isSetWorkingDay;
  @override
  State<HaveConsult> createState() => _HaveConsultState();
}

class _HaveConsultState extends State<HaveConsult> {
  TextEditingController fromCtl =
      TextEditingController(text: FormatTime.formatTime(format: Format.dMy));
  FocusNode fromFn = FocusNode();
  TextEditingController toCtl =
      TextEditingController(text: FormatTime.formatTime(format: Format.dMy));
  FocusNode toFn = FocusNode();
  late WorkingDayBloc workingDayBloc;

  @override
  void didChangeDependencies() {
    workingDayBloc = BlocProvider.of<WorkingDayBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    fromCtl.dispose();
    fromFn.dispose();
    toCtl.dispose();
    toFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text(
            widget.title ?? LocaleKeys.haveConsult.tr(),
            style: h3(fontWeight: '700', context: context),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldCpn(
                controller: fromCtl,
                focusNode: fromFn,
                showPrefixIcon: true,
                readOnly: true,
                labelText: LocaleKeys.from.tr(),
                functionPrefix: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 1000)),
                    lastDate: DateTime.now().add(const Duration(days: 1000)),
                    helpText: LocaleKeys.fromDate.tr(),
                  ).then((value) {
                    if (widget.isSetWorkingDay) {
                      workingDayBloc.add(ChangeFromDateEvent(fromCtl: value!));
                    }
                    fromCtl.text = FormatTime.formatTime(
                        format: Format.dMy, dateTime: value);
                  });
                },
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: TextFieldCpn(
                controller: toCtl,
                focusNode: toFn,
                showPrefixIcon: true,
                readOnly: true,
                labelText: LocaleKeys.to.tr(),
                functionPrefix: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 1000)),
                    lastDate: DateTime.now().add(const Duration(days: 1000)),
                    helpText: LocaleKeys.toDate.tr(),
                  ).then((value) {
                    if (widget.isSetWorkingDay) {
                      workingDayBloc.add(ChangeToDateEvent(toCtl: value!));
                    }
                    toCtl.text = FormatTime.formatTime(
                        format: Format.dMy, dateTime: value);
                  });
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

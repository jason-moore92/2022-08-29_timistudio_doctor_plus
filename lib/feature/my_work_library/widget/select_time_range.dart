import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/bloc/working_time/bloc_working_time.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SelectTimeRange extends StatefulWidget {
  const SelectTimeRange(
      {Key? key,
      required this.toCtl,
      required this.fromCtl,
      required this.index})
      : super(key: key);
  final TextEditingController fromCtl;
  final TextEditingController toCtl;
  final int index;
  @override
  State<SelectTimeRange> createState() => _SelectTimeRangeState();
}

class _SelectTimeRangeState extends State<SelectTimeRange> {
  FocusNode fromFn = FocusNode();
  FocusNode toFn = FocusNode();
  late WorkingTimeBloc workingTimeBloc;

  @override
  void didChangeDependencies() {
    workingTimeBloc = BlocProvider.of<WorkingTimeBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    fromFn.dispose();
    toFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFieldCpn(
            controller: widget.fromCtl,
            focusNode: fromFn,
            showPrefixIcon: true,
            prefixIcon: icTime,
            labelText: LocaleKeys.from.tr(),
            readOnly: true,
            functionPrefix: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                helpText: LocaleKeys.fromDate.tr(),
              ).then((value) => {widget.fromCtl.text = value!.format(context)});
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: TextFieldCpn(
            controller: widget.toCtl,
            focusNode: toFn,
            readOnly: true,
            prefixIcon: icTime,
            showPrefixIcon: true,
            labelText: LocaleKeys.to.tr(),
            functionPrefix: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                helpText: LocaleKeys.toDate.tr(),
              ).then((value) => {widget.toCtl.text = value!.format(context)});
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 24),
          child: AnimationClick(
              function: () {
                workingTimeBloc
                    .add(RemoveWorkingTimeEvent(index: widget.index));
              },
              child: const ImageAsset(close)),
        )
      ],
    );
  }
}

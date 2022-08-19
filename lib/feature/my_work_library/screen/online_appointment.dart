import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/model/working_time_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/util/format_time.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/bloc/working_day/bloc_working_day.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/bloc/working_time/bloc_working_time.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/screen/set_working_day.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class OnlineAppointment extends StatefulWidget {
  const OnlineAppointment({Key? key}) : super(key: key);

  @override
  State<OnlineAppointment> createState() => _OnlineAppointmentState();
}

class _OnlineAppointmentState extends State<OnlineAppointment> {
  bool openSendMess = true;
  bool isEdit = false;
  bool includeHoliday = true;
  TextEditingController descriptionNote = TextEditingController();
  FocusNode descriptionFocus = FocusNode();
  TextEditingController priceNote = TextEditingController();
  FocusNode priceFocus = FocusNode();
  List<String> dayWork = ['M', 'T', 'W', 'T', 'F', 'S'];
  List<WorkingTimeModel> timeWork = [];
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now().add(const Duration(days: 2));

  Widget component(String title, String number, String unit,
      {bool hasEdit = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: hasEdit
                    ? (isEdit
                        ? Row(
                            children: [
                              Expanded(
                                child: TextFieldCpn(
                                  hintText: title,
                                  labelText: title,
                                  controller: priceNote,
                                  focusNode: priceFocus,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 16),
                                  child: ElevatedCpn(
                                    gradient: linear,
                                    textButton: 'Save',
                                    textStyle: h5(
                                        color: Theme.of(context).color12,
                                        fontWeight: '700'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: AnimationClick(
                                  function: () {
                                    setState(() {
                                      isEdit = !isEdit;
                                    });
                                  },
                                  child: Text(
                                    LocaleKeys.cancel.tr(),
                                    style: h7(color: grayBlue),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Text(
                            title,
                            style: h7(context: context),
                          ))
                    : Text(
                        title,
                        style: h7(context: context),
                      ),
              ),
              hasEdit
                  ? (isEdit
                      ? const SizedBox()
                      : AnimationClick(
                          function: () {
                            setState(() {
                              isEdit = !isEdit;
                            });
                          },
                          child: const ImageAsset(icBase),
                        ))
                  : const SizedBox()
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: number,
            style: h5(context: context, fontFamily: 'Oswald'),
            children: <TextSpan>[
              TextSpan(
                text: unit,
                style: h7(context: context),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    BlocProvider.of<WorkingDayBloc>(context).add(InitialWorkingDayEvent());
    BlocProvider.of<WorkingTimeBloc>(context).add(InitialWorkingTimeEvent());
    super.initState();
  }

  @override
  void dispose() {
    descriptionNote.dispose();
    descriptionFocus.dispose();
    priceNote.dispose();
    priceFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          isEdit = false;
        });
      },
      child: Scaffold(
        appBar: const AppBarCpn(
          iconLeft: icBack,
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.onlineAppointment.tr(),
                  style: h1(context: context, fontWeight: '700'),
                ),
                CupertinoSwitch(
                    value: openSendMess,
                    onChanged: (value) {
                      setState(() {
                        openSendMess = value;
                      });
                    })
              ],
            ),
            Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.only(top: 24),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: color4.withOpacity(0.04),
                    offset: const Offset(0, 5),
                    blurRadius: 10)
              ], color: grey100, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  component(LocaleKeys.servicePrice.tr(), '\$45', ' / 30 mins'),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: component(LocaleKeys.consulted.tr(), '58', ' times',
                        hasEdit: false),
                  ),
                  AppWidget.divider2(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.workingDayTime.tr(),
                        style: h5(context: context, fontWeight: '700'),
                      ),
                      AnimationClick(
                        function: () {
                          Navigator.of(context).pushNamed(Routes.setWorkingDay,
                              arguments: SetWorkingDay(dayWork: dayWork));
                        },
                        child: const ImageAsset(icBase),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 12),
                    child: Text(
                      'Day',
                      style: h5(context: context),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                    width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 8);
                      },
                      shrinkWrap: true,
                      itemCount: dayWork.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 24,
                          height: 24,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: tiffanyBlue),
                          child: Text(
                            dayWork[index],
                            style: h7(fontWeight: '600', color: grey100),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: BlocBuilder<WorkingDayBloc, WorkingDayState>(
                        builder: (context, state) {
                      if (state is WorkingDaySuccess) {
                        fromDate = state.fromCtl;
                        toDate = state.toCtl;
                      }
                      return RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Apply from ',
                          style: h6(context: context),
                          children: <TextSpan>[
                            TextSpan(
                              text: FormatTime.formatTime(
                                  format: Format.dMy, dateTime: fromDate),
                              style: h6(context: context, fontWeight: '700'),
                            ),
                            TextSpan(
                              text: ' to ',
                              style: h6(context: context),
                            ),
                            TextSpan(
                              text: FormatTime.formatTime(
                                  format: Format.dMy, dateTime: toDate),
                              style: h6(context: context, fontWeight: '700'),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  BlocBuilder<WorkingDayBloc, WorkingDayState>(
                      builder: (context, state) {
                    if (state is WorkingDaySuccess) {
                      includeHoliday = state.includeHoliday;
                    }
                    return includeHoliday
                        ? Text(
                            'Included holidays',
                            style: h6(context: context),
                          )
                        : const SizedBox();
                  }),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 16),
                    child: Text(
                      'Time',
                      style: h5(context: context),
                    ),
                  ),
                  BlocBuilder<WorkingTimeBloc, WorkingTimeState>(
                      builder: (context, state) {
                    if (state is WorkingTimeSuccess) {
                      timeWork = state.workingTime;
                    }
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 16);
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: timeWork.length,
                      itemBuilder: (context, index) {
                        return Text(
                          timeWork[index].fromDate! +
                              ' - ' +
                              timeWork[index].toDate!,
                          style: h5(context: context),
                        );
                      },
                    );
                  }),
                  TextFieldCpn(
                    maxLength: 200,
                    hintText: LocaleKeys.checkAvailable.tr(),
                    labelText: LocaleKeys.description.tr(),
                    controller: descriptionNote,
                    focusNode: descriptionFocus,
                    maxLines: 4,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

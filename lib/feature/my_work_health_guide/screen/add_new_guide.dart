import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/drop_down.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/patient_card.dart';
import 'package:flutter_doctor_plus/common/widget/sliding_segmented.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/text_field_2.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/feature/my_work_health_guide/bloc/health_guide_created_me/list_created_me_bloc.dart';
import 'package:flutter_doctor_plus/feature/my_work_health_guide/bloc/health_guide_created_me/list_created_me_event.dart';
import '../widget/add_image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class AddNewGuide extends StatefulWidget {
  const AddNewGuide({Key? key}) : super(key: key);

  @override
  State<AddNewGuide> createState() => _AddNewGuideState();
}

class _AddNewGuideState extends State<AddNewGuide>
    with TickerProviderStateMixin {
  TextEditingController nameGuideCtl = TextEditingController();
  FocusNode nameGuideFn = FocusNode();
  TextEditingController taskDetailCtl = TextEditingController();
  FocusNode taskDetailFn = FocusNode();
  late TabController controlle;
  late TabController controlle2;
  late ListCreatedMeBloc listCreatedMeBloc;

  void share(int value) {
    setState(() {
      controlle2.index = value;
    });
  }

  void chooseGender(int value) {
    setState(() {
      controlle.index = value;
    });
  }

  @override
  void initState() {
    controlle = TabController(length: 3, vsync: this);
    controlle2 = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    listCreatedMeBloc = BlocProvider.of<ListCreatedMeBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    nameGuideCtl.dispose();
    nameGuideFn.dispose();
    taskDetailCtl.dispose();
    taskDetailFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        iconLeft: close,
        center: Text(
          LocaleKeys.addNewGuide.tr(),
          style: h3(fontWeight: '700', context: context),
        ),
        right: AnimationClick(
          function: () {
            listCreatedMeBloc.add(AddCreatedMeEvent(
                tipModel: TipModel(
                    titleTip: nameGuideCtl.text.trim(),
                    nameDoctor: user.name,
                    avtDoctor: user.avt,
                    image: image5,
                    description: taskDetailCtl.text.trim(),
                    enrolled: 0,
                    forPatientWho: [
                  controlle.index == 0
                      ? 'all'
                      : (controlle.index == 1 ? ' male' : 'female'),
                  '18'
                ],
                    patientDo: const [])));
            Navigator.of(context).pop();
          },
          child: Text(
            controlle2.index != 1
                ? LocaleKeys.public.tr()
                : LocaleKeys.send.tr(),
            style: h5(fontWeight: '700', color: dodgerBlue),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AddImage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: TextField2Cpn(
                      controller: nameGuideCtl,
                      focusNode: nameGuideFn,
                      hintText: LocaleKeys.enterTipName.tr(),
                    ),
                  ),
                  Text(
                    LocaleKeys.forPatientWho.tr(),
                    style: h3(fontWeight: '700', context: context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 24),
                    child: SlidingSegmented(
                      title: LocaleKeys.gender.tr(),
                      controlle: controlle,
                      onTap: chooseGender,
                    ),
                  ),
                  Text(
                    LocaleKeys.age.tr(),
                    style: h7(context: context, fontWeight: '600'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 24),
                    child: Row(
                      children: const [
                        Expanded(
                          flex: 1,
                          child: Dropdown(
                            items: ['Over'],
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 2,
                          child: Dropdown(
                            items: ['Select'],
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    LocaleKeys.category.tr(),
                    style: h7(context: context, fontWeight: '600'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4, bottom: 24),
                    child: Dropdown(
                      items: ['Select'],
                    ),
                  ),
                  SlidingSegmented(
                    title: LocaleKeys.share.tr(),
                    tabs: [LocaleKeys.public.tr(), LocaleKeys.private2.tr()],
                    controlle: controlle2,
                    onTap: share,
                  ),
                  controlle2.index == 1
                      ? ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 16);
                          },
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return PatientCard(
                              patient: patients[0],
                              hasMargin: false,
                              hasClose: true,
                            );
                          },
                        )
                      : const SizedBox(),
                  controlle2.index == 1
                      ? AnimationClick(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  LocaleKeys.addPatients.tr(),
                                  style:
                                      h6(color: dodgerBlue, fontWeight: '600'),
                                ),
                              ),
                              const ImageAsset(
                                icPlus,
                                color: dodgerBlue,
                                width: 16,
                                height: 16,
                              )
                            ],
                          ),
                        )
                      : const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(top: 48, bottom: 32),
                    child: Text(
                      LocaleKeys.patientDo.tr(),
                      style: h3(fontWeight: '700', context: context),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: grey100,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldCpn(
                          controller: taskDetailCtl,
                          focusNode: taskDetailFn,
                          maxLines: 5,
                          hasMutilLine: true,
                          labelText: LocaleKeys.taskDetail.tr(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 4),
                          child: Text(
                            LocaleKeys.frequency.tr(),
                            style: h7(context: context, fontWeight: '600'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Dropdown(
                                  items: ['Select'],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            IconButtonCpn(
                              paddingAll: 10,
                              path: icOption,
                              iconColor: grayBlue,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: ElevatedCpn(
                      gradient: linear,
                      leftWidget: const ImageAsset(icPlus, color: grey100),
                      textButton: LocaleKeys.addTask.tr(),
                      textStyle: h5(
                          color: Theme.of(context).color12, fontWeight: '700'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

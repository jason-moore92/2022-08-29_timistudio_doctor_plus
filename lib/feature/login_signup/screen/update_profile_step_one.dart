import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class UpdateProfileStepOne extends StatefulWidget {
  const UpdateProfileStepOne({Key? key}) : super(key: key);

  @override
  State<UpdateProfileStepOne> createState() => _UpdateProfileStepOneState();
}

class _UpdateProfileStepOneState extends State<UpdateProfileStepOne> {
  TextEditingController firstNameCtl = TextEditingController();
  FocusNode firstNameFn = FocusNode();
  TextEditingController lastNameCtl = TextEditingController();
  FocusNode lastNameFn = FocusNode();
  TextEditingController nationalIDCtl = TextEditingController();
  FocusNode nationalIDFn = FocusNode();
  TextEditingController homeAddressCtl = TextEditingController();
  FocusNode homeAddressFn = FocusNode();
  TextEditingController birthdayCtl = TextEditingController();
  FocusNode birthdayFn = FocusNode();
  bool selectMale = true;
  bool selectFemale = false;

  Widget gender(String icon, String title, {required bool selected}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              boxShadow: selected
                  ? [
                      BoxShadow(
                          color: dodgerBlue.withOpacity(0.3),
                          offset: const Offset(0, 10),
                          blurRadius: 20)
                    ]
                  : [],
              color: selected ? dodgerBlue : backgroundColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: selected ? dodgerBlue : border)),
          child: ImageAsset(
            icon,
            width: 32,
            height: 32,
            color: selected ? grey100 : grayBlue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            title,
            style: h6(context: context, fontWeight: selected ? '700' : '400'),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    firstNameCtl.dispose();
    firstNameFn.dispose();
    lastNameCtl.dispose();
    lastNameFn.dispose();
    nationalIDCtl.dispose();
    nationalIDFn.dispose();
    homeAddressCtl.dispose();
    homeAddressFn.dispose();
    birthdayCtl.dispose();
    birthdayFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const AppBarCpn(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: ElevatedCpn(
            function: () {
              Navigator.of(context).pushNamed(Routes.updateProfileStepTwo);
            },
            gradient: linear,
            textButton: LocaleKeys.Continue.tr(),
            rightWidget: const Icon(
              Icons.arrow_right_alt_rounded,
              size: 24,
            ),
            textStyle: h5(color: Theme.of(context).color12, fontWeight: '700'),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.step.tr() + ' 1 ' + LocaleKeys.of.tr() + ' 3 ',
                  style: h7(context: context, fontWeight: '700'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    LocaleKeys.basicInformation.tr(),
                    style: h1(context: context, fontWeight: '700'),
                  ),
                ),
                Text(
                  LocaleKeys.shareYourInformation.tr(),
                  style: h6(context: context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: const ImageAsset(
                              avt1,
                              height: 112,
                            ),
                          )),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedCpn(
                                function: () {},
                                gradient: linear,
                                textButton: LocaleKeys.uploadYourAvatar.tr(),
                                textStyle: h5(
                                    color: Theme.of(context).color12,
                                    fontWeight: '700'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  LocaleKeys.yourAvatarShould.tr(),
                                  style: h6(context: context, color: grayBlue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: TextFieldCpn(
                    controller: firstNameCtl,
                    focusNode: firstNameFn,
                    labelText: LocaleKeys.firstName.tr(),
                  ),
                ),
                TextFieldCpn(
                  controller: lastNameCtl,
                  focusNode: lastNameFn,
                  labelText: LocaleKeys.lastName.tr(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  child: TextFieldCpn(
                    controller: nationalIDCtl,
                    focusNode: nationalIDFn,
                    labelText: LocaleKeys.nationalID.tr(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    LocaleKeys.gender.tr(),
                    style: h7(context: context, fontWeight: '600'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimationClick(
                        function: () {
                          setState(() {
                            selectMale = true;
                            selectFemale = false;
                          });
                        },
                        child: gender(icMale, LocaleKeys.mle.tr(),
                            selected: selectMale),
                      ),
                      AnimationClick(
                        function: () {
                          setState(() {
                            selectMale = false;
                            selectFemale = true;
                          });
                        },
                        child: gender(icFemale, LocaleKeys.femle.tr(),
                            selected: selectFemale),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  child: TextFieldCpn(
                    controller: homeAddressCtl,
                    focusNode: homeAddressFn,
                    showPrefixIcon: true,
                    prefixIcon: icPinMap,
                    labelText: LocaleKeys.homeAddress.tr(),
                  ),
                ),
                TextFieldCpn(
                  controller: birthdayCtl,
                  focusNode: birthdayFn,
                  showPrefixIcon: true,
                  labelText: LocaleKeys.birthday.tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

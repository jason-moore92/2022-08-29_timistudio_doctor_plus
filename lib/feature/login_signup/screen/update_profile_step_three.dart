import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/additional_model.dart';
import 'package:flutter_doctor_plus/common/model/education_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/outlined_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/drop_down.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/feature/login_signup/bloc/list_additional/bloc_list_additional.dart';
import 'package:flutter_doctor_plus/feature/login_signup/bloc/list_education/bloc_list_education.dart';
import 'package:flutter_doctor_plus/feature/login_signup/widget/additional_widget.dart';
import 'package:flutter_doctor_plus/feature/login_signup/widget/attach_photo.dart';
import 'package:flutter_doctor_plus/feature/login_signup/widget/education_widget.dart';
import 'package:flutter_doctor_plus/feature/login_signup/widget/work_profile_cpn.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class UpdateProfileStepThree extends StatefulWidget {
  const UpdateProfileStepThree({Key? key}) : super(key: key);

  @override
  State<UpdateProfileStepThree> createState() => _UpdateProfileStepThreeState();
}

class _UpdateProfileStepThreeState extends State<UpdateProfileStepThree> {
  TextEditingController numberCtl = TextEditingController();
  FocusNode numberFn = FocusNode();
  TextEditingController npiNumberCtl = TextEditingController();
  FocusNode npiNumberFn = FocusNode();
  TextEditingController expirationCtl = TextEditingController();
  FocusNode expirationFn = FocusNode();
  List<EducationModel> education = [];
  List<AdditionalModel> additional = [];

  @override
  void initState() {
    BlocProvider.of<ListEducationBloc>(context).add(InitialEducationEvent());
    BlocProvider.of<ListAdditionalBloc>(context).add(InitialAdditionalEvent());
    super.initState();
  }

  @override
  void dispose() {
    numberCtl.dispose();
    numberFn.dispose();
    npiNumberCtl.dispose();
    npiNumberFn.dispose();
    expirationCtl.dispose();
    expirationFn.dispose();
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
              Navigator.of(context).pushNamed(Routes.sentVerifySuccess);
            },
            gradient: linear,
            textButton: LocaleKeys.sendVerifyRequest.tr(),
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
                  LocaleKeys.step.tr() + ' 3 ' + LocaleKeys.of.tr() + ' 3 ',
                  style: h7(context: context, fontWeight: '700'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    LocaleKeys.othersInformation.tr(),
                    style: h1(context: context, fontWeight: '700'),
                  ),
                ),
                Text(
                  LocaleKeys.shareYourInformation.tr(),
                  style: h6(context: context),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48, bottom: 12),
                  child: Text(
                    LocaleKeys.education.tr(),
                    style: h3(context: context, fontWeight: '700'),
                  ),
                ),
                BlocBuilder<ListEducationBloc, ListEducationsState>(
                  builder: (context, state) {
                    if (state is ListEducationsSuccess) {
                      education = state.education;
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, _) {
                        return const SizedBox(
                          height: 24,
                        );
                      },
                      itemCount: education.length,
                      itemBuilder: (context, index) {
                        return EducationWidget(
                          educationModel: education[index],
                        );
                      },
                    );
                  },
                ),
                OutlinedCpn(
                  function: () {
                    BlocProvider.of<ListEducationBloc>(context)
                        .add(AddEducationEvent());
                  },
                  leftWidget: const Icon(
                    Icons.add,
                    size: 24,
                    color: dodgerBlue,
                  ),
                  vertical: 10,
                  textStyle: h7(fontWeight: '700', color: grayBlue),
                  textButton: LocaleKeys.addMoreSchool.tr(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48, bottom: 24),
                  child: Text(
                    LocaleKeys.medicalBoardLicense.tr(),
                    style: h3(context: context, fontWeight: '700'),
                  ),
                ),
                Dropdown(
                  title: LocaleKeys.licenseCounty.tr(),
                  items: const ['Boston'],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Dropdown(
                    title: LocaleKeys.licenseOfState.tr(),
                    items: const ['New York'],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldCpn(
                        controller: numberCtl,
                        focusNode: numberFn,
                        labelText: LocaleKeys.licenseNumber.tr(),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFieldCpn(
                        controller: npiNumberCtl,
                        focusNode: npiNumberFn,
                        labelText: LocaleKeys.npiNumber.tr(),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: TextFieldCpn(
                    controller: expirationCtl,
                    focusNode: expirationFn,
                    showPrefixIcon: true,
                    prefixIcon: calendar,
                    labelText: LocaleKeys.licenseExpiration.tr(),
                  ),
                ),
                AttachPhoto(textButton: LocaleKeys.attachLicensePhoto.tr()),
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 48),
                  child: AppWidget.divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    LocaleKeys.cerAwards.tr(),
                    style: h1(context: context, fontWeight: '700'),
                  ),
                ),
                Text(
                  LocaleKeys.skipIt.tr(),
                  style: h6(context: context),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24, bottom: 32),
                  child: WorkProfileCpn(),
                ),
                AppWidget.divider(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 48, top: 32),
                  child: WorkProfileCpn(
                    type: Type.awards,
                  ),
                ),
                AppWidget.divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 48, bottom: 12),
                  child: Text(
                    LocaleKeys.additionalLinks.tr(),
                    style: h3(context: context, fontWeight: '700'),
                  ),
                ),
                Text(
                  LocaleKeys.skipIt.tr(),
                  style: h6(context: context),
                ),
                BlocBuilder<ListAdditionalBloc, ListAdditionalState>(
                  builder: (context, state) {
                    if (state is ListAdditionalSuccess) {
                      additional = state.additional;
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, _) {
                        return const SizedBox(
                          height: 24,
                        );
                      },
                      itemCount: additional.length,
                      itemBuilder: (context, index) {
                        return AdditionalWidget(
                          additionalModel: additional[index],
                        );
                      },
                    );
                  },
                ),
                OutlinedCpn(
                  function: () {
                    BlocProvider.of<ListAdditionalBloc>(context)
                        .add(AddAdditionalEvent());
                  },
                  leftWidget: const Icon(
                    Icons.add,
                    size: 24,
                    color: dodgerBlue,
                  ),
                  vertical: 10,
                  textStyle: h7(fontWeight: '700', color: grayBlue),
                  textButton: LocaleKeys.addMoreCertification.tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

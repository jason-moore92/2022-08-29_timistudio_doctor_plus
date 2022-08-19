import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/hospital_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/outlined_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/feature/login_signup/bloc/list_hospital_extra/bloc_list_hospital_extra.dart';
import 'package:flutter_doctor_plus/feature/login_signup/widget/hospital_widget.dart';
import 'package:flutter_doctor_plus/feature/login_signup/widget/search_result.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class UpdateProfileStepTwo extends StatefulWidget {
  const UpdateProfileStepTwo({Key? key}) : super(key: key);

  @override
  State<UpdateProfileStepTwo> createState() => _UpdateProfileStepTwoState();
}

class _UpdateProfileStepTwoState extends State<UpdateProfileStepTwo> {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  TextEditingController yearCtl = TextEditingController();
  FocusNode yearFn = FocusNode();
  TextEditingController languageCtl = TextEditingController();
  FocusNode languageFn = FocusNode();
  List<HospitalModel> hospitals = [];

  @override
  void initState() {
    BlocProvider.of<ListHospitalExtraBloc>(context).add(InitialHospitalEvent());
    super.initState();
  }

  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    yearCtl.dispose();
    yearFn.dispose();
    languageCtl.dispose();
    languageFn.dispose();
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
              Navigator.of(context).pushNamed(Routes.updateProfileStepThree);
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
                  LocaleKeys.step.tr() + ' 2 ' + LocaleKeys.of.tr() + ' 3 ',
                  style: h7(context: context, fontWeight: '700'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    LocaleKeys.yourWorkProfile.tr(),
                    style: h1(context: context, fontWeight: '700'),
                  ),
                ),
                Text(
                  LocaleKeys.shareYourInformation.tr(),
                  style: h6(context: context),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 32),
                    child: SearchResult(
                      searchCtl: searchCtl,
                      searchFn: searchFn,
                      label: LocaleKeys.specialities.tr(),
                      labels: const ['Allergy & Immunology', 'Cardiology'],
                    )),
                AppWidget.divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    LocaleKeys.primaryHospital.tr(),
                    style: h5(context: context, fontWeight: '700'),
                  ),
                ),
                const HospitalWidget(),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    LocaleKeys.extraHospital.tr(),
                    style: h5(context: context, fontWeight: '700'),
                  ),
                ),
                BlocBuilder<ListHospitalExtraBloc, ListHospitalExtrasState>(
                  builder: (context, state) {
                    if (state is ListHospitalExtrasSuccess) {
                      hospitals = state.hospitals;
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, _) {
                        return const SizedBox(
                          height: 24,
                        );
                      },
                      itemCount: hospitals.length,
                      itemBuilder: (context, index) {
                        return HospitalWidget(
                          hospitalModel: hospitals[index],
                        );
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 32),
                  child: OutlinedCpn(
                    function: () {
                      BlocProvider.of<ListHospitalExtraBloc>(context)
                          .add(AddEvent());
                    },
                    leftWidget: const Icon(
                      Icons.add,
                      size: 24,
                      color: dodgerBlue,
                    ),
                    vertical: 10,
                    textStyle: h7(fontWeight: '700', color: grayBlue),
                    textButton: LocaleKeys.addMoreHospital.tr(),
                  ),
                ),
                AppWidget.divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 24),
                  child: TextFieldCpn(
                    controller: yearCtl,
                    focusNode: yearFn,
                    labelText: LocaleKeys.yearExperience.tr(),
                  ),
                ),
                SearchResult(
                  searchCtl: languageCtl,
                  searchFn: languageFn,
                  label: LocaleKeys.language.tr(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

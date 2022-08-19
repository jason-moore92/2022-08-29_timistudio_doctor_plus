import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/search.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ShareDoctor extends StatefulWidget {
  const ShareDoctor({Key? key}) : super(key: key);

  @override
  State<ShareDoctor> createState() => _ShareDoctorState();
}

class _ShareDoctorState extends State<ShareDoctor> {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();

  List<DoctorModel> selectedList = [];

  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    super.dispose();
  }

  final List<DoctorModel> networkDoctor =
      doctorsDemo.where((element) => element.isMyNetwork).toList();
  final List<DoctorModel> otherDoctor =
      doctorsDemo.where((element) => !element.isMyNetwork).toList();

  Widget shareDoctorItem({required DoctorModel doctor}) {
    bool isSelected =
        selectedList.indexWhere((element) => element == doctor) != -1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ImageAsset(doctor.avt, width: 48, height: 48),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name,
                  style: h4(color: dodgerBlue, fontWeight: '700'),
                ),
                const SizedBox(height: 4),
                Text(
                  doctor.specialities![0].nameSpec,
                  style: h7(context: context),
                ),
              ],
            ),
          ],
        ),
        Checkbox(
            value: isSelected,
            activeColor: tiffanyBlue,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: dodgerBlue),
                borderRadius: BorderRadius.circular(4)),
            onChanged: (value) {
              setState(() {
                if (isSelected) {
                  selectedList.remove(doctor);
                } else {
                  selectedList.add(doctor);
                }
              });
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const IconButtonCpn(
        path: icFilter,
        bgColor: orange,
        paddingAll: 16,
        hasOutline: false,
        iconColor: grey100,
      ),
      appBar: AppBarCpn(
        color: grey100,
        center: Text(
          LocaleKeys.shareDoctor.tr(),
          style: h3(
            context: context,
            fontWeight: '700',
          ),
        ),
        right: AnimationClick(
          function: selectedList.isEmpty
              ? () {}
              : () {
                  Navigator.of(context).pop(selectedList);
                },
          child: Text(
            LocaleKeys.share.tr(),
            style: h5(
              color: selectedList.isEmpty ? grayBlue : dodgerBlue,
              fontWeight: '700',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchCpn(
                controller: searchCtl,
                focusNode: searchFn,
                hintText: LocaleKeys.enterSearchDoctor.tr(),
              ),
              const SizedBox(height: 40),
              networkDoctor.isNotEmpty
                  ? Column(
                      children: [
                        Text(
                          LocaleKeys.myNetwork.tr(),
                          style: h3(context: context, fontWeight: '700'),
                        ),
                        const SizedBox(height: 24),
                      ],
                    )
                  : const SizedBox(),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 24);
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: networkDoctor.length,
                itemBuilder: (context, index) {
                  return shareDoctorItem(
                    doctor: networkDoctor[index],
                  );
                },
              ),
              otherDoctor.isNotEmpty
                  ? Column(
                      children: [
                        Text(
                          LocaleKeys.maybeYouKnow.tr(),
                          style: h3(context: context, fontWeight: '700'),
                        ),
                        const SizedBox(height: 24),
                      ],
                    )
                  : const SizedBox(),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 24);
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: otherDoctor.length,
                itemBuilder: (context, index) {
                  return shareDoctorItem(
                    doctor: otherDoctor[index],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

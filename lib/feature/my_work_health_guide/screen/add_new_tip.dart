import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/drop_down.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/text_field_2.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import '../bloc/health_tips.dart/bloc_list_tips.dart';
import '../widget/add_image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class AddNewTip extends StatefulWidget {
  const AddNewTip({Key? key}) : super(key: key);

  @override
  State<AddNewTip> createState() => _AddNewTipState();
}

class _AddNewTipState extends State<AddNewTip> {
  TextEditingController nameTipCtl = TextEditingController();
  FocusNode nameTipFn = FocusNode();
  TextEditingController tipDetailCtl = TextEditingController();
  FocusNode tipDetailFn = FocusNode();
  late ListTipsBloc listTipsBloc;

  @override
  void didChangeDependencies() {
    listTipsBloc = BlocProvider.of<ListTipsBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    nameTipCtl.dispose();
    nameTipFn.dispose();
    tipDetailCtl.dispose();
    tipDetailFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        iconLeft: close,
        center: Text(
          LocaleKeys.addNewTip.tr(),
          style: h3(fontWeight: '700', context: context),
        ),
        right: AnimationClick(
          function: () {
            BlocProvider.of<ListTipsBloc>(context).add(AddTipEvent(
                tipModel: TipModel(
                    avtDoctor: user.avt,
                    nameDoctor: user.name,
                    description: tipDetailCtl.text.trim(),
                    titleTip: nameTipCtl.text.trim(),
                    image: image3)));
            Navigator.of(context).pop();
          },
          child: Text(
            LocaleKeys.public.tr(),
            style: h5(fontWeight: '700', color: dodgerBlue),
          ),
        ),
      ),
      body: Column(
        children: [
          const AddImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: TextField2Cpn(
                      controller: nameTipCtl,
                      focusNode: nameTipFn,
                      hintText: LocaleKeys.enterTipName.tr(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24, top: 40),
                    child: Dropdown(
                      title: LocaleKeys.shareTipOn.tr(),
                      items: const ['Select'],
                    ),
                  ),
                  TextFieldCpn(
                    maxLines: 5,
                    hasMutilLine: true,
                    controller: tipDetailCtl,
                    focusNode: tipDetailFn,
                    labelText: LocaleKeys.tipDetails.tr(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

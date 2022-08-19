import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/my_work_health_guide/bloc/health_guide_saved/list_saved_bloc.dart';
import 'package:flutter_doctor_plus/feature/my_work_health_guide/bloc/health_guide_saved/list_saved_event.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import '../widget/saved_detail_app_bar.dart';

class HealthGuideDetail extends StatefulWidget {
  const HealthGuideDetail({Key? key, required this.tipModel}) : super(key: key);
  final TipModel tipModel;

  @override
  State<HealthGuideDetail> createState() => _HealthGuideDetailState();
}

class _HealthGuideDetailState extends State<HealthGuideDetail> {
  late ListSavedBloc listSavedBloc;
  Widget listView(BuildContext context,
      {String? image,
      String? text,
      List<dynamic>? list,
      bool isPatientWho = true}) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButtonCpn(
                path: image!,
                hasOutline: false,
                paddingAll: 4,
                bgColor: tiffanyBlue.withOpacity(0.16),
                iconColor: tiffanyBlue,
              ),
            ),
            Text(
              text!,
              style: h5(context: context, fontWeight: '700'),
            ),
          ],
        ),
        ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 16, bottom: 16, left: 48),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list!.length,
          itemBuilder: (context, index) {
            return isPatientWho
                ? Text(
                    list[index],
                    style: h4(context: context),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          list[index].action,
                          style: h4(context: context),
                        ),
                      ),
                      Text(
                        list[index].time,
                        style: h5(color: grayBlue),
                      )
                    ],
                  );
          },
        )
      ],
    );
  }

  @override
  void didChangeDependencies() {
    listSavedBloc = BlocProvider.of<ListSavedBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: ElevatedCpn(
          function: () {
            listSavedBloc.add(UnSavedEvent(tipModel: widget.tipModel));
            Navigator.of(context).pop();
          },
          gradient: linear,
          textButton: LocaleKeys.unsave.tr(),
          textStyle: h5(color: Theme.of(context).color12, fontWeight: '700'),
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SavedDetailAppBar(
                tipModel: widget.tipModel,
              )
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 32),
                    child: Text(
                      '${widget.tipModel.enrolled} enrolled',
                      style: h7(context: context),
                    ),
                  ),
                  Text(
                    LocaleKeys.createdBy.tr(),
                    style: h7(context: context),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: ImageAsset(
                              widget.tipModel.avtDoctor,
                              width: 48,
                              height: 48,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.tipModel.nameDoctor,
                                style:
                                    h5(color: dodgerBlue, fontWeight: '700')),
                            Text('Integrative Medicine',
                                style: h7(context: context)),
                          ],
                        )
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: LocaleKeys.sharedHealthGuide.tr(),
                      style: h7(context: context),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Healthy',
                          style: h7(color: dodgerBlue, fontWeight: '600'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 48, bottom: 40),
                    child: listView(context,
                        text: LocaleKeys.forPatientWho.tr(),
                        image: icAccount,
                        list: widget.tipModel.forPatientWho),
                  ),
                  listView(context,
                      text: LocaleKeys.patientDo.tr(),
                      image: icCheckmark,
                      isPatientWho: false,
                      list: widget.tipModel.patientDo)
                ],
              ),
            ),
          )),
    );
  }
}

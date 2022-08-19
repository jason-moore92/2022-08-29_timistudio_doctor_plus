import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/bottom_custom.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/notifications.dart';
import 'package:flutter_doctor_plus/common/widget/request_bottom.dart';
import 'package:flutter_doctor_plus/common/widget/section_card.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/search.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();

  late AnimationController controller;
  final double progress = 0.4;
  final int total = 9;
  final int current = 5;
  final List<Map<dynamic, dynamic>> sections = [
    {"name": LocaleKeys.schedule.tr(), "img": imgSchedule, "path": Routes.schedule},
    {"name": LocaleKeys.consultHistory.tr(), "img": imgConsultHistory, 'path': Routes.nextConsults},
    {"name": LocaleKeys.patientManagement.tr(), "img": imgPatientManagement, "path": Routes.patientManagement},
    {
      "name": LocaleKeys.freeConsult.tr(),
      "img": imgFreeQuestion,
      "path": Routes.freeConsults,
      'new': 155,
    },
  ];

  final BottomCustomController bottomController = BottomCustomController();

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      upperBound: progress,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bottomController.show(context, backgroundColor, RequestBottom(event: listEvents[2]));
    });
  }

  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBarCpn(
            size: Size(width, 128),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  const ImageAsset(avt1, width: 40, height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(LocaleKeys.hi.tr() + " " + currentUser.name + ",", style: h3(color: black, fontWeight: '700')),
                      Text(LocaleKeys.greeting.tr(), style: h5(color: black))
                    ]),
                  ),
                ]),
                Notifications(
                    function: () {
                      Navigator.of(context).pushNamed(Routes.notification);
                    },
                    notifications: 1,
                    iconPath: icNotification,
                    iconColor: neonFuchsia,
                    bgColor: grey100)
              ]),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              AnimationClick(
                function: () {
                  Navigator.of(context).pushNamed(Routes.search);
                },
                child: SearchCpn(
                  enabled: false,
                  controller: searchCtl,
                  focusNode: searchFn,
                  hintText: LocaleKeys.searchAll.tr(),
                  fillColor: grey100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: LocaleKeys.consult.tr() + " ",
                            style: h1(context: context, fontWeight: '700'),
                            children: <TextSpan>[
                              TextSpan(
                                text: LocaleKeys.forToday.tr(),
                                style: h1(context: context),
                              )
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "$current ",
                                style: h6(context: context, color: grayBlue),
                              ),
                              TextSpan(
                                text: LocaleKeys.of.tr() + " ",
                                style: h6(context: context, color: grayBlue),
                              ),
                              TextSpan(
                                text: "$total ",
                                style: h6(context: context, color: grayBlue),
                              ),
                              TextSpan(
                                text: LocaleKeys.completed.tr(),
                                style: h6(context: context, color: grayBlue),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(alignment: Alignment.center, children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: grey100,
                        ),
                        child: CircularProgressIndicator(
                            strokeWidth: 8,
                            value: controller.value,
                            semanticsLabel: 'Linear progress indicator',
                            backgroundColor: isabelline,
                            color: tiffanyBlue),
                      ),
                      Text('${total - current}', style: h0(color: tiffanyBlue, hasUnderLine: true))
                    ]),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, crossAxisSpacing: 16, mainAxisSpacing: 16),
                    itemCount: sections.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return SectionCard(
                        item: sections[index],
                      );
                    }),
              ),
              BottomCustom(
                controller: bottomController,
                backgroundColor: grey100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

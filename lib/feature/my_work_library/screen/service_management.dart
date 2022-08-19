import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ServiceManagement extends StatelessWidget {
  const ServiceManagement({Key? key}) : super(key: key);

  Widget service(BuildContext context,
      {String? icon, String? title, String? subTitle, String? price}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: grey100,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: color4.withOpacity(0.04),
              offset: const Offset(0, 5),
              blurRadius: 10)
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageAsset(icon!),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: h5(context: context, fontWeight: '700'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 4),
                    child: Text(
                      subTitle!,
                      style: h4(context: context),
                    ),
                  ),
                  Text(
                    price!,
                    style: h5(color: grayBlue),
                  ),
                ],
              ),
            ),
          ),
          const Icon(Icons.keyboard_arrow_right_rounded,
              size: 24, color: grayBlue),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCpn(
        iconLeft: icBack,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.servicesManagement.tr(),
                style: h1(context: context, fontWeight: '700'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 24),
                child: AnimationClick(
                  function: () {
                    Navigator.of(context).pushNamed(Routes.sendMessage);
                  },
                  child: service(context,
                      title: LocaleKeys.sendMessage.tr(),
                      icon: icTypeMessage,
                      subTitle: LocaleKeys.sendMultipleMessages.tr(),
                      price: 'Starting from \$45 per visit'),
                ),
              ),
              AnimationClick(
                child: service(context,
                    icon: icTypeVideo,
                    title: LocaleKeys.video.tr() +
                        '/' +
                        LocaleKeys.voice.tr() +
                        '/' +
                        LocaleKeys.liveChat.tr(),
                    subTitle: LocaleKeys.minutesCall.tr(),
                    price: 'Starting from \$45 per visit'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 24),
                child: AnimationClick(
                  function: () {
                    Navigator.of(context).pushNamed(Routes.onlineAppointment);
                  },
                  child: service(context,
                      icon: icTypeAppointment,
                      title: LocaleKeys.onlineAppointment.tr(),
                      subTitle: LocaleKeys.checkAvailable.tr(),
                      price: 'Starting from \$45 per visit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

List<Widget> pages = [
  SliderPage(
    title: LocaleKeys.helpPeople.tr(),
    image: img1,
  ),
  SliderPage(
    title: LocaleKeys.connect.tr(),
    image: img2,
  ),
  SliderPage(
    title: LocaleKeys.private.tr(),
    image: img3,
  ),
  SliderPage(
    title: LocaleKeys.manage.tr(),
    image: img4,
  ),
];

class SliderPage extends StatelessWidget {
  const SliderPage({Key? key, required this.title, required this.image})
      : super(key: key);
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    final double height = AppWidget.getHeightScreen(context);
    final double width = AppWidget.getWidthScreen(context);
    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height / 58 * 39,
          child: ImageAsset(
            image,
            width: width,
            height: height / 58 * 39,
          ),
        ),
        Positioned(
          left: 32,
          right: 32,
          bottom: 24,
          child: Column(
            children: [
              Text(
                title,
                style: h2(context: context, fontWeight: '700'),
              ),
            ],
          ),
        )
      ],
    );

    // Stack(
    //   alignment: Alignment.center,
    //   children: [
    //     Image.asset(image, height: height, width: width, fit: BoxFit.fill),
    //     Positioned(
    //       top: height / 2 + height / 10,
    //       left: 0,
    //       right: 0,
    //       child: Column(
    //         children: [
    //           Text(
    //             title,
    //             textAlign: TextAlign.center,
    //             style: h5(context: context),
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class TitleRow extends StatelessWidget {
  const TitleRow(
      {Key? key, required this.title, this.isSimple = false, this.route})
      : super(key: key);

  final String title;
  final bool isSimple;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: h3(context: context, fontWeight: '700'),
          ),
          !isSimple
              ? AnimationClick(
                  function: () {
                    if (route != null) {
                      Navigator.of(context).pushNamed(route!);
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        LocaleKeys.seeAll.tr(),
                        style: h7(color: dodgerBlue),
                      ),
                      const SizedBox(width: 4),
                      const ImageAsset(icArrowRight, width: 12, height: 12),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

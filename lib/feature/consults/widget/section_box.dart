import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';

class SectionBox extends StatelessWidget {
  const SectionBox({
    Key? key,
    required this.title,
    required this.icon,
    required this.child,
    this.paddingHorizontal = 24,
    this.paddingChild = const EdgeInsets.all(24),
  }) : super(key: key);

  final Widget child;
  final String title;
  final String icon;
  final double paddingHorizontal;
  final EdgeInsets paddingChild;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        decoration: BoxDecoration(
          color: grey100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 16,
              offset: Offset(0, 2),
              color: Color.fromRGBO(0, 64, 128, 0.04),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: isabelline),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: tiffanyBlue.withOpacity(0.16),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ImageAsset(icon, color: tiffanyBlue),
                  ),
                  const SizedBox(width: 16),
                  Text(title, style: h5(context: context, fontWeight: '700'))
                ],
              ),
            ),
            Container(
              padding: paddingChild,
              child: child,
            ),
          ],
        ));
  }
}

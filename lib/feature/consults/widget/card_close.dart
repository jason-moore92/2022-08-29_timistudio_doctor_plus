import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';

class CardClose extends StatelessWidget {
  const CardClose({Key? key, required this.child, this.onClose})
      : super(key: key);
  final Widget child;
  final Function? onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: child,
          ),
          Positioned(
            top: 16,
            right: 16,
            child: AnimationClick(
              function: onClose ?? () {},
              child: const ImageAsset(
                icCloseCard,
                width: 16,
                height: 16,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: grey100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 16,
            offset: Offset(0, 2),
            color: Color.fromRGBO(167, 115, 102, 0.16),
          ),
        ],
      ),
    );
  }
}

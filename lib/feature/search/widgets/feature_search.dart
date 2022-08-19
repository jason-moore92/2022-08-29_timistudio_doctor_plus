import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';

class FeatureSearch extends StatelessWidget {
  const FeatureSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
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
        children: [
          Stack(
            children: [
              const ImageAsset(
                imgChickenpox,
                width: double.infinity,
                height: 180,
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: Text(
                  'Flu',
                  style: h3(color: grey100, fontWeight: '700'),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Influenza (also known as “flu”) is a contagious respiratory illness caused by influenza viruses. It can cause mild to severe illness…",
              style: h6(context: context),
            ),
          ),
          const Divider(),
          AnimationClick(
            child: Container(
              padding: const EdgeInsets.only(top: 4, bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Read More',
                    style: h6(color: dodgerBlue, fontWeight: '700'),
                  ),
                  const SizedBox(width: 8),
                  const ImageAsset(
                    icArrowRight,
                    width: 16,
                    height: 16,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/model/review_model.dart';
import 'package:flutter_doctor_plus/common/util/format_time.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';

class ItemReview extends StatelessWidget {
  const ItemReview({Key? key, required this.reviewModel}) : super(key: key);
  final ReviewModel reviewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ImageAsset(
                  reviewModel.avt,
                  width: 40,
                  height: 40,
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        reviewModel.name,
                        style: h7(fontWeight: '700', context: context),
                      ),
                    ),
                    Row(
                      children: [
                        const ImageAsset(icRateFull, width: 16, height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            reviewModel.rate.toString(),
                            style: h7(context: context, fontWeight: '600'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                FormatTime.formatTime(
                    format: Format.mdy, dateTime: reviewModel.date),
                style: h7(color: grayBlue),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 12),
          child: Text(
            reviewModel.review,
            style: h6(context: context),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimationClick(
              child: Text(
                'Report',
                style: h7(color: grayBlue),
              ),
            ),
            const AnimationClick(
              child: ImageAsset(
                icLikeComment,
                width: 16,
                height: 16,
                color: grayBlue,
              ),
            )
          ],
        )
      ],
    );
  }
}

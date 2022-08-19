import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/topic_model.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';

class TopicDetailAppBar extends StatelessWidget {
  const TopicDetailAppBar(
      {Key? key, required this.topicModel, this.isMyWorkTopicDetail = false})
      : super(key: key);
  final TopicModel topicModel;
  final bool isMyWorkTopicDetail;
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      expandedHeight: height / 203 * 70,
      leading: const SizedBox(),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double top = constraints.biggest.height;
          return FlexibleSpaceBar(
            title: top == MediaQuery.of(context).padding.top + kToolbarHeight
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonCpn(
                            path: icBack,
                            function: () {
                              Navigator.of(context).pop();
                            }),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Text(
                              topicModel.titleTopic,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: h3(context: context, fontWeight: '700'),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: IconButtonCpn(
                                  iconColor: dodgerBlue,
                                  borderColor: dodgerBlue,
                                  path:
                                      isMyWorkTopicDetail ? icEdit : icFollow),
                            ),
                            const IconButtonCpn(
                                iconColor: dodgerBlue,
                                borderColor: dodgerBlue,
                                path: share)
                          ],
                        )
                      ],
                    ),
                  )
                : Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      topicModel.titleTopic,
                      style: h2(context: context, fontWeight: '700'),
                    ),
                  ),
            titlePadding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            centerTitle: true,
            background: Stack(
              children: [
                ImageAsset(topicModel.image,
                    width: double.infinity, height: height / 203 * 66),
                Positioned(
                  left: 24,
                  right: 24,
                  top: height / 203 * 13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButtonCpn(
                          iconColor: grey100,
                          hasOutline: false,
                          bgColor: black.withOpacity(0.2),
                          path: icBack,
                          function: () {
                            Navigator.of(context).pop();
                          }),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: IconButtonCpn(
                                iconColor: grey100,
                                hasOutline: false,
                                bgColor: black.withOpacity(0.2),
                                path: isMyWorkTopicDetail ? icEdit : icFollow),
                          ),
                          IconButtonCpn(
                              iconColor: grey100,
                              hasOutline: false,
                              bgColor: black.withOpacity(0.2),
                              path: share)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

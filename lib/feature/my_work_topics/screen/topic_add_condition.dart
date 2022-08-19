import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/search.dart';
import '../bloc/list_condition_topic/bloc_list_condition_topic.dart';
import 'package:flutter_doctor_plus/feature/search_special/widget/quick_access.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class TopicAddCondition extends StatefulWidget {
  const TopicAddCondition({Key? key, this.typeSearch = TypeSearch.condition})
      : super(key: key);
  final TypeSearch typeSearch;
  @override
  State<TopicAddCondition> createState() => _TopicAddConditionState();
}

class _TopicAddConditionState extends State<TopicAddCondition> {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  List<Map<String, dynamic>> selected = [];
  late ListConditionTopicBloc listConditionTopicBloc;

  @override
  void initState() {
    BlocProvider.of<ListConditionTopicBloc>(context)
        .add(InitialConditionEvent());
    BlocProvider.of<ListConditionTopicBloc>(context).conditionSearch.clear();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    listConditionTopicBloc = BlocProvider.of<ListConditionTopicBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        color: grey100,
        center: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchCpn(
              onChanged: (value) {
                listConditionTopicBloc
                    .add(SearchConditionEvent(searchValue: value));
              },
              controller: searchCtl,
              focusNode: searchFn,
              hintText: 'Search...',
            ),
          ),
        ),
        right: AnimationClick(
          function: () {
            Navigator.of(context).pop();
          },
          child: Text(
            LocaleKeys.add.tr(),
            style: h5(fontWeight: '700', color: dodgerBlue),
          ),
        ),
      ),
      floatingActionButton: const QuickAccess(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        color: backgroundColor2,
        child: ListView(
          children: [
            BlocBuilder<ListConditionTopicBloc, ListConditionTopicState>(
              builder: (context, state) {
                return listConditionTopicBloc.conditionSelected.isEmpty
                    ? const SizedBox(
                        height: 24,
                      )
                    : Container(
                        height: 30,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 24, bottom: 16),
                        child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: dodgerBlue),
                                child: Text(
                                  listConditionTopicBloc
                                      .conditionSelected[index],
                                  style: h8(color: grey100, fontWeight: '700'),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 8);
                            },
                            itemCount: listConditionTopicBloc
                                .conditionSelected.length),
                      );
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: grey100),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: IconButtonCpn(
                              path: icCondition,
                              hasOutline: false,
                              paddingAll: 4,
                              iconColor: tiffanyBlue,
                              bgColor: tiffanyBlue.withOpacity(0.16),
                            )),
                        Text(LocaleKeys.allConditions.tr(),
                            style: h5(
                              context: context,
                              fontWeight: '700',
                            ))
                      ],
                    ),
                  ),
                  AppWidget.divider2(),
                  BlocBuilder<ListConditionTopicBloc, ListConditionTopicState>(
                    builder: (context, state) {
                      if (state is ListConditionTopicSuccess) {
                        selected = state.condition;
                      }
                      return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      selected[index]['condition'],
                                      style: h4(
                                          color: dodgerBlue, fontWeight: '600'),
                                    ),
                                  ),
                                  Checkbox(
                                      value: selected[index]['selected'],
                                      activeColor: tiffanyBlue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      onChanged: (value) {
                                        listConditionTopicBloc.add(
                                            SelectedConditionEvent(
                                                conditionSelected:
                                                    selected[index]
                                                        ['condition']));
                                      })
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return AppWidget.divider2();
                          },
                          itemCount: selected.length);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

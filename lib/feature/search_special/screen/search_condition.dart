import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/search.dart';
import 'package:flutter_doctor_plus/feature/search_special/bloc/list_condition/bloc_list_condition.dart';
import 'package:flutter_doctor_plus/feature/search_special/widget/quick_access.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SearchCondition extends StatefulWidget {
  const SearchCondition({Key? key, this.typeSearch = TypeSearch.condition})
      : super(key: key);
  final TypeSearch typeSearch;
  @override
  State<SearchCondition> createState() => _SearchConditionState();
}

class _SearchConditionState extends State<SearchCondition> {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  List<String> selected = [];
  late ListConditionBloc listConditionBloc;

  @override
  void initState() {
    BlocProvider.of<ListConditionBloc>(context).add(InitialConditionEvent());
    BlocProvider.of<ListConditionBloc>(context).conditionSearch.clear();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    listConditionBloc = BlocProvider.of<ListConditionBloc>(context);
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
        center: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SearchCpn(
              onChanged: (value) {
                listConditionBloc.add(SearchConditionEvent(searchValue: value));
              },
              controller: searchCtl,
              focusNode: searchFn,
              hintText: LocaleKeys.enterCondition.tr(),
            ),
          ),
        ),
      ),
      floatingActionButton: const QuickAccess(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        color: backgroundColor2,
        child: Column(
          children: [
            Expanded(
              child: Container(
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
                    Expanded(
                      child: BlocBuilder<ListConditionBloc, ListConditionState>(
                        builder: (context, state) {
                          if (state is ListConditionSuccess) {
                            selected = state.conditions;
                          }
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 16),
                                  child: Text(
                                    selected[index],
                                    style: h4(
                                        color: dodgerBlue, fontWeight: '600'),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return AppWidget.divider2();
                              },
                              itemCount: selected.length);
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/util/string.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/search.dart';
import 'package:flutter_doctor_plus/feature/free_consults/widgets/list_question.dart';
import 'package:flutter_doctor_plus/feature/search/widgets/list_tips.dart';
import 'package:flutter_doctor_plus/feature/search/widgets/list_topics.dart';
import 'package:flutter_doctor_plus/feature/search/widgets/result_all.dart';
import 'package:flutter_doctor_plus/feature/search/widgets/list_doctors.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key, this.searchText = ''}) : super(key: key);

  final String searchText;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult>
    with TickerProviderStateMixin {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  late TabController tabCtl = TabController(length: 5, vsync: this);

  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    super.dispose();
  }

  @override
  void initState() {
    searchCtl.text = widget.searchText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: tabCtl.index == 3
          ? IconButtonCpn(
              path: icFilter,
              bgColor: orange,
              paddingAll: 16,
              hasOutline: false,
              iconColor: grey100,
              function: () {
                Navigator.of(context).pushNamed(Routes.doctorFilter);
              },
            )
          : const SizedBox(),
      appBar: AppBarCpn(
        color: grey100,
        left: const SizedBox(),
        center: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SearchCpn(
              controller: searchCtl,
              focusNode: searchFn,
              hintText: LocaleKeys.enterSearchDoctor.tr(),
              onSubmitted: (value) {
                Navigator.of(context).pushReplacementNamed(
                  Routes.searchResult,
                  arguments: SearchResult(searchText: value),
                );
              },
              onChanged: (value) {},
            ),
          ),
        ),
        right: AnimationClick(
          function: () {
            Navigator.of(context).pop();
          },
          child: Text(
            LocaleKeys.cancel.tr(),
            style: h5(
              color: dodgerBlue,
              fontWeight: '700',
            ),
          ),
        ),
        bottom: TabBar(
          onTap: (value) {
            setState(() {});
          },
          padding: const EdgeInsets.symmetric(horizontal: 24),
          isScrollable: true,
          controller: tabCtl,
          labelStyle: h5(context: context, fontWeight: '700'),
          unselectedLabelStyle: h5(color: grayBlue, fontWeight: '600'),
          labelColor: black,
          unselectedLabelColor: grayBlue,
          indicatorColor: black,
          indicatorWeight: 2,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(text: LocaleKeys.all.tr()),
            Tab(text: LocaleKeys.answers.tr()),
            Tab(text: LocaleKeys.topics.tr()),
            Tab(text: LocaleKeys.experts.tr().toCapitalized()),
            Tab(text: LocaleKeys.tips.tr()),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: TabBarView(
          controller: tabCtl,
          children: [
            const ResultAll(),
            ListQuestion(questions: freeConsultQuestions),
            ListTopic(topics: topics),
            ListDoctor(doctors: doctorsDemo),
            ListTips(tips: tips),
          ],
        ),
      ),
    );
  }
}

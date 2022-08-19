import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/search.dart';
import 'package:flutter_doctor_plus/feature/search/screens/search_result.dart';
import 'package:flutter_doctor_plus/feature/search/widgets/search_special_section.dart';
import 'package:flutter_doctor_plus/feature/search/widgets/top_patients.dart';
import 'package:flutter_doctor_plus/feature/search/widgets/trending_topics.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();

  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                  Navigator.of(context).pushNamed(
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
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 24,
            bottom: MediaQuery.of(context).padding.bottom + 24,
          ),
          child: Column(
            children: const [
              TopPatients(),
              TrendingTopics(),
              SizedBox(height: 24),
              SearchSpecialSection(),
            ],
          ),
        ),
      ),
    );
  }
}

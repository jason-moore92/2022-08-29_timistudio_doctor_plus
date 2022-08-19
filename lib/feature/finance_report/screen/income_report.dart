import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/feature/finance_report/widget/base_service.dart';
import 'package:flutter_doctor_plus/feature/finance_report/widget/base_time.dart';
import 'package:flutter_doctor_plus/feature/finance_report/widget/income_app_bar.dart';

class IncomeReport extends StatefulWidget {
  const IncomeReport({Key? key}) : super(key: key);

  @override
  State<IncomeReport> createState() => _IncomeReportState();
}

class _IncomeReportState extends State<IncomeReport>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, value) => [
                IncomeAppBar(
                  controller: _controller,
                )
              ],
          body: TabBarView(
            controller: _controller,
            children: [
              BaseService(),
              const BaseTime(),
            ],
          )),
    );
  }
}

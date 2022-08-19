import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/util/get_events.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/consult_day_item.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;

  late final ValueNotifier<List<DateTime>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier([_selectedDay!]);
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;

  final BoxDecoration box = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
  );

  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedEvents.value = daysInRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = [start];
    } else if (end != null) {
      _selectedEvents.value = [end];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCpn(
          color: grey100,
          iconLeft: close,
          right: Padding(
            padding: EdgeInsets.only(left: 24),
            child: IconButtonCpn(
                path: icSearch, iconColor: dodgerBlue, borderColor: dodgerBlue),
          )),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: grey100,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TableCalendar(
                rangeSelectionMode: _rangeSelectionMode,
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                  CalendarFormat.week: 'Week',
                },
                calendarFormat: _calendarFormat,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                calendarBuilders: CalendarBuilders(
                  singleMarkerBuilder: (context, date, _) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (date == _selectedDay ||
                                date == _rangeStart ||
                                date == _rangeEnd)
                            ? grey100
                            : goGreen,
                      ),
                      width: 4,
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 1.5),
                    );
                  },
                ),
                eventLoader: getEvents,
                startingDayOfWeek: StartingDayOfWeek.monday,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                      _rangeStart = null;
                      _rangeEnd = null;
                      _rangeSelectionMode = RangeSelectionMode.toggledOff;
                    });
                  }
                },
                onRangeSelected: _onRangeSelected,
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                rowHeight: 56,
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    border: const Border.fromBorderSide(
                        BorderSide(color: dodgerBlue)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  todayTextStyle: h5(color: dodgerBlue, fontWeight: '700'),
                  defaultTextStyle: h5(context: context),
                  defaultDecoration: box,
                  weekendDecoration: box,
                  outsideDecoration: box,
                  rangeStartDecoration: BoxDecoration(
                    color: dodgerBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  rangeEndDecoration: BoxDecoration(
                    color: dodgerBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  selectedTextStyle: h5(color: grey100, fontWeight: '700'),
                  selectedDecoration: BoxDecoration(
                    color: dodgerBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  disabledDecoration: box,
                  withinRangeDecoration: box,
                  rowDecoration: box,
                ),
                headerStyle: HeaderStyle(
                  headerMargin: const EdgeInsets.all(8),
                  titleTextStyle: h8(fontWeight: '700', color: grayBlue),
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                ),
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 1, 1),
                focusedDay: _focusedDay,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              '${DateFormat('MMMM d').format(_rangeStart ?? _selectedDay ?? DateTime.now())} - ${DateFormat('MMMM d').format(_rangeEnd ?? _rangeStart ?? _selectedDay ?? DateTime.now())}'
                  .toUpperCase(),
              textAlign: TextAlign.left,
              style: h8(color: grayBlue),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<DateTime>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ConsultDayItem(time: value[index]);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:equatable/equatable.dart';

class WorkingTimeModel extends Equatable {
  const WorkingTimeModel({this.id, this.fromDate, this.toDate});
  final int? id;
  final String? fromDate;
  final String? toDate;

  @override
  List<Object?> get props => [id, fromDate, toDate];
}

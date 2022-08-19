import 'package:equatable/equatable.dart';
import 'event_model.dart';

class EventDayModel extends Equatable {
  const EventDayModel({required this.day, this.events});
  final String day;
  final List<EventModel>? events;

  @override
  List<Object?> get props => [day, events];
}

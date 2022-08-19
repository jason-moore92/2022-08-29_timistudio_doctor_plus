import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  const ChatModel(
      {required this.avt,
      required this.name,
      this.currentMessage,
      this.online = false,
      this.currentTimeIncome,
      this.currentMessTime});
  final List<String> avt;
  final String name;
  final String? currentMessage;
  final bool online;
  final DateTime? currentTimeIncome;
  final DateTime? currentMessTime;

  @override
  List<Object?> get props =>
      [avt, name, currentMessage, online, currentTimeIncome, currentMessTime];
}

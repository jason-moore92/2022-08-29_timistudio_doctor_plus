import 'package:equatable/equatable.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.userName,
    this.avatar = icAccount,
  });
  final String userName;
  final String avatar;

  @override
  List<Object?> get props => [userName, avatar];
}

import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getValueBool({String? input}) async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.getBool(input!)!;
}

Future<void> setShared(bool value, String key) async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  shared.setBool(key, value);
}

Future<void> saveNotification({String? value, String? key}) async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  shared.setString('$key', value!);
}

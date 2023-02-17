import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:starter_app/src/models/user.dart';

class AuthService with ListenableServiceMixin {
  static late SharedPreferences prefs;
  ReactiveValue<UserModel?> _user = ReactiveValue<UserModel?>(null);

  UserModel? get user => _user.value;
  final String _prefKey = "USER_LOGIN_DATA";

  AuthService() {
    listenToReactiveValues([_user]);
    _restoreUserFromLocal();
  }

  set user(UserModel? user) {
    _user.value = user;
    _storeLocally();
  }

  logout() {
    _clearUserFromLocal();
  }

  _storeLocally() async {
    if (_user.value == null) return;
    prefs.setString(_prefKey, jsonEncode(_user.value?.toJson() ?? {}));
  }

  _restoreUserFromLocal() async {
    if (!prefs.containsKey(_prefKey)) return;
    user = UserModel.fromJson(jsonDecode(prefs.getString(_prefKey) ?? "{}"));
  }

  _clearUserFromLocal() async {
    if (!prefs.containsKey(_prefKey)) return;
    prefs.remove(_prefKey);
    _user.value = null;
  }
}
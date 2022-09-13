import 'package:shared_preferences/shared_preferences.dart';

const String _empName = "emp_name";

class UserRepository {
  const UserRepository(SharedPreferences prefs) : _prefs = prefs;
  final SharedPreferences _prefs;
  String? get name => _prefs.getString(_empName);
  Future<bool> login(String name) {
    return _prefs.setString(_empName, name);
  }

  Future<bool> logOut() {
    return _prefs.clear();
  }

  bool get isLoggedIn => _prefs.containsKey(_empName);
}

import 'package:nearby_places/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();
  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();
  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del nameUser
  String get nameUser {
    return _prefs.getString('nameUser') ?? '';
  }

  set nameUser(String value) {
    _prefs.setString('nameUser', value);
  }

  // GET y SET del lName
  String get lName {
    return _prefs.getString('lName') ?? '';
  }

  set lName(String value) {
    _prefs.setString('lName', value);
  }

  // GET y SET del idUser
  String get idUser {
    return _prefs.getString('idUser') ?? '';
  }

  set idUser(String value) {
    _prefs.setString('idUser', value);
  }

  // GET y SET del idUser
  String get userName {
    return _prefs.getString('userName');
  }

  set userName(String value) {
    _prefs.setString('userName', value);
  }

  // GET y SET del password
  String get password {
    return _prefs.getString('password');
  }

  set password(String value) {
    _prefs.setString('password', value);
  }

  void cleanUserPref() {
    this.nameUser = null;
    this.lName = null;
    this.userName = null;
    this.password = null;
  }

  void setUserPref(UserModel user) {
    if (user.name != null) this.nameUser = user.name.trim();
    if (user.lName != null) this.lName = user.lName.trim();
    if (user.userName != null) this.userName = user.userName.trim();
    if (user.password != null) this.password = user.password.trim();
  }
}

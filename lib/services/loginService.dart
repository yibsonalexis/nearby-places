import 'package:nearby_places/preferences/userPreference.dart';

class LoginService {
  
  final UserPreferences _pref = UserPreferences();

  Future<bool> login(String userName, String password) async {
    try {
      return (userName == _pref.userName && password == _pref.password);
    } catch (e) {
      return false;
    }
  }
}

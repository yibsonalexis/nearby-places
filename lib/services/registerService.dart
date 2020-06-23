import 'package:nearby_places/models/userModel.dart';
import 'package:nearby_places/preferences/userPreference.dart';

class RegisterService {
  final UserPreferences _pref = UserPreferences();
  Future<bool> saveUser(UserModel user) async {
    try {
      _pref.setUserPref(user);
      return true;
    } catch (e) {
      return false;
    }
  }
}

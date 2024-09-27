import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('userTokenMemo', token);
}

Future<String?> getUserToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('userTokenMemo');
}

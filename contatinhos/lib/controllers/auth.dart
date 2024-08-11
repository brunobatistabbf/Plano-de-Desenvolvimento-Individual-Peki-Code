import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';
import '../pages/login.dart';
import '../pages/home.dart';

class AuthController extends GetxController {
  final ApiService _apiService = ApiService();
  var isAuthentication = false.obs;

  Future<void> login(String username, String password) async{
    final token = await _apiService.login(username, password);
    if (token != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      isAuthentication.value = true;
      Get.offAll(Home());
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    isAuthentication.value = false;
    Get.offAll(Login());
  }
}
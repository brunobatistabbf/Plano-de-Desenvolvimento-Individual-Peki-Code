import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';
import '../pages/login.dart';
import '../pages/home.dart';

class AuthController extends GetxController {
  final ApiService _apiService = ApiService();
  var isAuthenticated = false.obs;

  Future<void> login(String username, String password) async {
    final token = await _apiService.login(username, password);
    if (token != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      isAuthenticated.value = true;
      Get.offAll(HomeScreen());
    }
  }

  Future<void> signup(String nome, String email, String senha) async {
    final success = await _apiService.signup(nome, email, senha);
    if (success) {
      Get.back();
      Get.snackbar('Sucesso!', 'Conta criada.');
    } else {
      Get.snackbar('Erro!', 'Falha ao criar conta.');
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    isAuthenticated.value = false;
    Get.offAll(Login());
  }
}

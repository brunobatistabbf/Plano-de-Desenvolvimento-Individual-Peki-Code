import 'package:get/get.dart';
import '../models/contact.dart';
import '../services/api_service.dart';

class ContactController extends GetxController {
  final ApiService _apiService = ApiService();
  var contatinhosList = <Contact>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchContatinhos();
  }

  Future<void> fetchContatinhos() async {
    var contatinhos = await _apiService.getContatos();
    if (contatinhos != null) {
      contatinhosList.value = contatinhos;
    }
  }

  Future<void> addContatinho(Contact contato) async {
    await _apiService.createContato(contato);
    await fetchContatinhos();
  }

  Future<void> updateContato(Contact contato) async {
    await _apiService.updateContato(contato);
    await fetchContatinhos();
  }

  Future<void> deleteContato(Contact contato) async {
    await _apiService.deleteContato(contato.id);
    await fetchContatinhos();
  }
}

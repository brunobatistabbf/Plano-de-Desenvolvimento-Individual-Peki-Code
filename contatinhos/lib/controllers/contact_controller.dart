import 'package:get/get.dart';
import '../models/contact.dart';
import '../services/api_service.dart';

class ContactController extends GetxController {
  final ApiService _apiService = ApiService();
  var contatinhosList = <Comments>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchContatinhos();
  }

  void fetchContatinhos() async {
    var contatinhos = await _apiService.getContatos();
    if (contatinhos != null) {
      contatinhosList.value = contatinhos;
    }
  }

  void addConatinho(Comments contato) async{
    await _apiService.createContato(contato);
    fetchContatinhos();
  }

  void updateContato(Comments contato) async {
    await _apiService.updateContato(contato);
    fetchContatinhos();
  }








}
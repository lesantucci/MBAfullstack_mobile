import 'package:http/http.dart';
import 'package:mba_ecommerce/commons/handler/http.dart';
import 'package:mba_ecommerce/models/costumer.model.dart';
import 'package:mba_ecommerce/variables/api-endpoints.dart';

class UsuarioService {

  Future<bool> realizarLogin(String login, String password) async {
    Response response = await HttpHandler.post(LOGIN, <String, dynamic>{'login': login, 'password': password});
    if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
  }

  Future<bool> cadastrarUsuario(Costumer costumer) async {
    Response response = await HttpHandler.post(CUSTOMER_ADD, <String, dynamic>{
      'name': costumer.name,
      'age': costumer.age,
      'email': costumer.email,
      'userPassword': costumer.userPassword,
      'address': costumer.address  });
    if (response.statusCode == 201) {
      return true;
      } else {
        return false;
      }
  }
}
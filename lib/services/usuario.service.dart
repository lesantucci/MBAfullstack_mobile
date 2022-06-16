import 'package:http/http.dart';
import 'package:social_network_flutter/commons/handler/http.dart';
import 'package:social_network_flutter/variables/api-endpoints.dart';

class UsuarioService {

  Future<bool> realizarLogin(String login, String password) async {
    Response response = await HttpHandler.post(LOGIN, <String, dynamic>{'login': login, 'password': password});
    print(response.body.toString());
    if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
  }

  Future<bool> cadastrarUsuario(String name, String email, String password) async {
    Response response = await HttpHandler.post(CUSTOMER_ADD, <String, dynamic>{
      'name': name,
      'age': 18,
      'email': email,
      'userPassword': password,
      'address': 'teste'  });
      print(response.body.toString());
    if (response.statusCode == 201) {
      return true;
      } else {
        return false;
      }
  }
}
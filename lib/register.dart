import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:social_network_flutter/home.dart';
import 'package:social_network_flutter/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  final String title = 'Cadastro';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _validate_password = '';

  void register() async {
    log('Teste');
    if(validatePassword()) {
      log('Teste2');
      String api = 'https://social-network-for-class.herokuapp.com/users';
      Response response = await post(
      Uri.parse(api),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{'name': _name, 'email': _email, 'password': _password}),
      );
    
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } else {
        _showMyDialog();
      }
    }
  }
    

  bool validatePassword() {
    return _password == _validate_password;
  }

  Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Ocorreu um erro'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Ocorreu um erro de comunicação com a base de dados ou algum dos campos está incompleto'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Fechar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child:TextFormField(
                onChanged: (text) {
                  setState(() {
                    _name = text;
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Informe o nome:',
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child:TextFormField(
                onChanged: (text) {
                  setState(() {
                    _email = text;
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Informe o email:',
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child:TextFormField(
                obscureText: true,
                onChanged: (text) {
                  setState(() {
                    _password = text;
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Informe a senha:',
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child:TextFormField(
                obscureText: true,
                onChanged: (text) {
                  setState(() {
                    _validate_password = text;
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Confirme a senha:',
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextButton(
                onPressed: () {
                  register();
                },
                child: const Text('Cadastrar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

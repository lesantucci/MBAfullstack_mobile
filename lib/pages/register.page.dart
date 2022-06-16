import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mba_ecommerce/models/costumer.model.dart';
import 'package:mba_ecommerce/pages/login.page.dart';
import 'package:mba_ecommerce/services/usuario.service.dart';

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
  int _idade = 0;
  String _address = '';
  String _validate_password = '';

  void register() async {
      if(validatePassword()) {
        final usuarioService = UsuarioService();
        usuarioService.cadastrarUsuario(Costumer(
          address: _address,
          age: _idade,
          email: _email,
          name: _name,
          userPassword: _password
          )).then((value) => {
          value ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          ) :
          _showMyDialog()
        });
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
                keyboardType: TextInputType.name,
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
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly],
                onChanged: (text) {
                  setState(() {
                    _idade = int.tryParse(text)!;
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Informe a idade:',
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child:TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (text) {
                  setState(() {
                    _email = text;
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Informe o email para Login:',
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child:TextFormField(
                keyboardType: TextInputType.streetAddress,
                onChanged: (text) {
                  setState(() {
                    _address = text;
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Informe o endereço:',
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

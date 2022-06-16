import 'package:flutter/material.dart';

import 'package:mba_ecommerce/pages/produtos.page.dart';
import 'package:mba_ecommerce/pages/register.page.dart';
import 'package:mba_ecommerce/services/usuario.service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  final String title = 'Login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _login = '';
  String _password = '';

  void signIn() async {
    final usuarioService = UsuarioService();
    usuarioService.realizarLogin(_login, _password).then((value) => {
      if(value) {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProdutosPage()),
      )} 
    });
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
                    _login = text;
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Informe o login:',
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextButton(
                    onPressed: () {
                      signIn();
                    },
                    child: const Text('Entrar'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterPage()),
                      );
                    },
                    child: const Text('Cadastrar'),
                  ),
                )
            ])
          ],
        ),
      ),
    );
  }
}

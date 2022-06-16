import 'package:flutter/material.dart';
import 'package:mba_ecommerce/models/product.model.dart';
import 'package:mba_ecommerce/services/produto.service.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({ Key? key }) : super(key: key);

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  List<Product> produtos = [];

  void listarProdutos() {
    final produtoService = ProdutoService();
    produtoService.listarProdutos().then((lista) => {
      setState(() {
        produtos = lista; 
      })
    });
  }

  @override
  void initState() {
    super.initState();
    listarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Produtos')),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int produto) {
              return ListTile(
                title: Text(produtos[produto].name),
                subtitle: Text(produtos[produto].factory.name),
                trailing: Text(produtos[produto].price.toString()),
              );
            },
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, ___) => Divider(),
            itemCount: produtos.length));
  }
}

import 'dart:convert';

import 'package:http/http.dart';
import 'package:mba_ecommerce/commons/handler/http.dart';
import 'package:mba_ecommerce/models/product.model.dart';
import 'package:mba_ecommerce/variables/api-endpoints.dart';

class ProdutoService {
  
  Future listarProdutos() async {
    Response response = await HttpHandler.get(PRODUCTS_LIST);
     if (response.statusCode == 200) {
        return List<Product>.from(
        json.decode(response.body).map((data) => Product.fromJson(data)));
      } else {
        return false;
      }
  }
}
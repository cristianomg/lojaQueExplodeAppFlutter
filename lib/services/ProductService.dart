import 'package:app/models/product.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductService{
  static Future<List<Product>> getProducts() async{
    var url = 'http://macoratti.net.br/catalogo/api/produtos/v2/todos';

    var header = {'Content-Type': "application/json"};

    var response = await http.get(url, headers: header);

    var result = json.decode(response.body);

    final products = List<Product>();
    
    if(response.statusCode == 200){
      for(Map map in result){
        products.add(Product.fromJson(map));
      }
    }

    return products;
  }
}
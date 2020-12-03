import 'package:app/models/product.dart';
import 'package:app/services/ProductService.dart';
import 'package:app/services/ShoppingCartOpendService.dart';
import 'package:app/widgets/alert.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  _addItem(productId) async {
    var result = await ShoppingCartOpendService.addItemOnCarOpend(productId);
    if (result != null) alert(context, "Erro", result);
    setState(() {
      _body();
    });
  }

  _body() {
    Future<List<Product>> products = ProductService.getProducts();
    return FutureBuilder(
        future: products,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<Product> products = snapshot.data;
          print(products.length);
          return _listViewProducts(products);
        });
  }

  _listViewProducts(products) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product p = products[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(p.name, style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Estoque: ${p.quantity}",
                      style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("R\$ ${(p.price / 100).toString()}",
                      style: TextStyle(fontSize: 20)),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                          onPressed: () =>
                              alert(context, "Descrição", p.description),
                          child: Text("Detalhes")),
                      IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          onPressed: () => _addItem(p.id))
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

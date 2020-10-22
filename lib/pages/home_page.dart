import 'package:app/models/product.dart';
import 'package:app/services/ProductService.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body()
    );
  }

  _body(){
    Future<List<Product>> products = ProductService.getProducts();
    return FutureBuilder(
      future: products,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
          child: CircularProgressIndicator(
          )
        );
      }
          List<Product> products = snapshot.data;
          return _listViewProducts(products);
        }
    );
  }

  _listViewProducts(products){
    return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index){
              Product p = products[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(child: Image.network(p.photos.first.url, width: 150)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(p.name, style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(p.description, style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(p.priceFormated.toString(), style: TextStyle(fontSize: 20)),
                    ),
                    ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            onPressed: null,
                            child: Text("Detalhes")),
                          IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: null)
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
        );
    
  }

}
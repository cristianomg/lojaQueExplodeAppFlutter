import 'package:app/models/product.dart';
import 'package:app/services/ProductService.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalogo de produtos"), centerTitle: true,),
      body: _body()
    );
  }

  _body(){
    Future<List<Product>> products = ProductService.getProducts();
    return FutureBuilder(
      future: products,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product> products = snapshot.data;
          return _listViewProducts(products);
        } else {
          return Center(
          child: Loading(indicator: BallPulseIndicator(), size: 100.0,color: Colors.blue),
        );
        }
      },
      initialData: new List<Product>(),
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
                    Center(child: Image.network(p.imagemUrl, width: 150)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(p.nome, style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(p.descricao, style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(p.preco.toString(), style: TextStyle(fontSize: 20)),
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
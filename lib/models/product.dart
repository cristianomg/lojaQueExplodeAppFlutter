
import 'package:app/models/photos.dart';

class Product {
  String name;
  String description;
  String categoryId;
  int price;
  double priceFormated;
  int quantity;
  Null category;
  Null complementaryProductData;
  List<Photos> photos;

  Product(
      {this.name,
      this.description,
      this.categoryId,
      this.price,
      this.quantity,
      this.category,
      this.complementaryProductData,
      this.photos}){
        this.priceFormated = this.price / 100;
      }

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    categoryId = json['categoryId'];
    price = json['price'];
    quantity = json['quantity'];
    category = json['category'];
    complementaryProductData = json['complementaryProductData'];
    priceFormated = price / 100;
    if (json['photos'] != null) {
      photos = new List<Photos>();
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['categoryId'] = this.categoryId;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['category'] = this.category;
    data['complementaryProductData'] = this.complementaryProductData;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
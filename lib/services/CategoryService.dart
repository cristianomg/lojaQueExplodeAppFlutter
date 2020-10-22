import 'package:app/models/category.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CategoryService{
  static Future<List<Category>> getCategories() async{
    var url = 'http://a07c596e34a0.ngrok.io/api/v1/category';


    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');

    var header = {'Content-Type': "application/json", "Authorization": 'Bearer $token'};


    var response = await http.get(url, headers: header);
    var result = json.decode(response.body);

    final categories = List<Category>();
    
    if(response.statusCode == 200){
      for(Map map in result){
        categories.add(Category.fromJson(map));
      }

    }

    return categories;
  }
}
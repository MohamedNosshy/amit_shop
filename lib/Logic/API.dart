
import 'dart:convert';
import 'package:amit_shope/Models/categoriesVM.dart';
import 'package:amit_shope/Models/productsVM.dart';
import 'package:http/http.dart' as http;

class API
{
  static Future<CategoriesVm> getItems() async
  {


    var response = await http.get(Uri.parse('https://retail.amit-learning.com/api/categories'));

    return CategoriesVm.fromJson(Map<String,dynamic>.from(json.decode(response.body.toString())));

  }

  static Future<ProductsVm> getProduct() async
  {

    var response = await http.get(Uri.parse('https://retail.amit-learning.com/api/products'));

    return ProductsVm.fromJson(Map<String,dynamic>.from(json.decode(response.body.toString())));



  }
}
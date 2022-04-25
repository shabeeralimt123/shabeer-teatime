import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:teatime/models/error_model.dart';
import 'package:teatime/models/product.dart';
import 'package:http/http.dart' as http;
class ProductRepository{
  Future<List<ProductModel>> getProducts({search}) async {
    print(GlobalConfiguration().get('api_base_url')+'products?search=$search');
    http.Response response = await http.get(GlobalConfiguration().get('api_base_url')+'products?search=${search ?? ''}');
    debugPrint(response.body);
    if(response.statusCode==200){
      final data = json.decode(response.body) as List;
      return data.map((e) => ProductModel.fromJson(e)).toList();
    }else{
      throw ErrorModel("Sorry! We Couldn't Connect to our servers");
    }
  }
}
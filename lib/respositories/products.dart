import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:teatime/models/error_model.dart';
import 'package:teatime/models/product.dart';
import 'package:http/http.dart' as http;



class ApiServices {
  final String apiurl = "http://194.233.65.81/teatime_saudi_po/api";
   Future<List<ProductModel>> getNewProducts({search}) async {
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


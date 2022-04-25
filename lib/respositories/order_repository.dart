import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teatime/models/branch.dart';
import 'package:teatime/models/error_model.dart';
import 'package:teatime/models/order_item_detail_model.dart';
import 'package:teatime/models/order_model.dart';

class OrderRepository{
  Future<bool> postOrder(List<Map<String,String>> items) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String b = preferences.getString("BRANCH");
    if(b!=null){
      BranchModel branch  = BranchModel.fromJson(json.decode(b));
      print({
        'branch':branch.id.toString(),
        'items':items
      });
      print(GlobalConfiguration().get("api_base_url")+"post_order");
      http.Response response= await http.post(GlobalConfiguration().get("api_base_url")+"post_order",body:{
        'branch':branch.id.toString(),
        'items':json.encode(items)
      });

      if(response.statusCode == 200){
        Map<String,dynamic> data = json.decode(response.body);
        preferences.setString("ORDER_ID", data['order_id']);
        return true;
      }else{
        debugPrint(response.body);
        throw ErrorModel("Sorry! We Couldn't connect to our servers");
      }
    }else{
      return false;
    }
  }

  Future<List<OrderModel>> getOrders() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String b = preferences.getString("BRANCH");
    if(b!=null){
      BranchModel branch  = BranchModel.fromJson(json.decode(b));

      http.Response response= await http.post(GlobalConfiguration().get("api_base_url")+"orders",body:{
        'branch':branch.id.toString()
      });

      if(response.statusCode == 200){
        final data = json.decode(response.body) as List;
       return data.map((e) => OrderModel.fromJson(e)).toList();
      }else{
        throw ErrorModel("Sorry! We Couldn't connect to our servers");
      }
    }else{
      return [];
    }
  }

  Future<List<OrderDetailItemModel>> getOrderDetails(poId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String b = preferences.getString("BRANCH");
    if(b!=null){
      http.Response response= await http.post(GlobalConfiguration().get("api_base_url")+"particulars",body:{
        'po_id':poId.toString()
      });

      if(response.statusCode == 200){
        final data = json.decode(response.body) as List;
        return data.map((e) => OrderDetailItemModel.fromJson(e)).toList();
      }else{
        throw ErrorModel("Sorry! We Couldn't connect to our servers");
      }
    }else{
      return [];
    }
  }
}
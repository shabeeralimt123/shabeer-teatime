import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teatime/models/branch.dart';
import 'package:teatime/models/error_model.dart';

import 'package:teatime/models/stock_item_detail_model.dart';
import 'package:teatime/models/stockmodel.dart';

class StockRepository {
  Future<bool> postStock(List<Map<String, dynamic>> items) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String b = preferences.getString("BRANCH");
    if (b != null) {
      BranchModel branch = BranchModel.fromJson(json.decode(b));
      print(
       json.encode({'items':items})
      );
      print(GlobalConfiguration().get("api_base_url") + "post_stocknew?branch_id=${branch.id}");
      http.Response response = await http.post(
          GlobalConfiguration().get("api_base_url") +
              "post_stocknew?branch_id=${branch.id}",
          body: 
             json.encode({'items':items})
          );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        preferences.setString("ITEM_ID", data['item_id']);
        return true;
      } else {
        debugPrint(response.body);
        throw ErrorModel("Sorry! We Couldn't connect to our servers");
      }
    } else {
      return false;
    }
  }

  Future<List<StockModel>> getStocks() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String b = preferences.getString("BRANCH");
    if (b != null) {
      BranchModel branch = BranchModel.fromJson(json.decode(b));

      http.Response response = await http
          .post(GlobalConfiguration().get("api_base_url") + "get_stock?branch_id=${branch.id}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data.map((e) => StockModel.fromJson(e)).toList();
      } else {
        throw ErrorModel("Sorry! We Couldn't connect to our servers");
      }
    } else {
      return [];
    }
  }

  Future<List<StockItemDetails>> getStockDetails(poId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String b = preferences.getString("BRANCH");
    if (b != null) {
      http.Response response = await http.post(
          GlobalConfiguration().get("api_base_url") + "get_details?fk_details=$poId",
         );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data.map((e) => StockItemDetails.fromJson(e)).toList();
      } else {
        throw ErrorModel("Sorry! We Couldn't connect to our servers");
      }
    } else {
      return [];
    }
  }
}

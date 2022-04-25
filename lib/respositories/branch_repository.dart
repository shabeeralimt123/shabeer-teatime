import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:teatime/models/branch.dart';
import 'package:http/http.dart' as http;
import 'package:teatime/models/error_model.dart';

class BranchRepository{
  Future<List<BranchModel>> getBranches()  async {
    print(GlobalConfiguration().get("api_base_url") + "branches");
    http.Response response = await http.get(GlobalConfiguration().get("api_base_url") + "branches");

    if(response.statusCode == 200){
      final data = json.decode(response.body) as List;
      return data.map((e) => BranchModel.fromJson(e )).toList();
    }else{
      throw ErrorModel("Sorry! We Couldn't Connect to Our Servers");
    }
  }
}
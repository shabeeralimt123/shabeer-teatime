import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:teatime/models/error_model.dart';
import 'package:teatime/models/unit_model.dart';

class UnitRepository {
  Future<List<UnitModel>> getunits() async {
    print(GlobalConfiguration().get("api_base_url") + "units");
    http.Response response =
        await http.get(GlobalConfiguration().get("api_base_url") + "units");

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((e) => UnitModel.fromJson(e)).toList();
    } else {
      throw ErrorModel("Sorry! We Couldn't Connect to Our Servers");
    }
  }
}

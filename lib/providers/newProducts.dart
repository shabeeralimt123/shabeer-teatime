




import 'package:flutter/material.dart';
import 'package:teatime/models/product.dart';
import 'package:teatime/respositories/products.dart';


class NewProductController with ChangeNotifier {
  ApiServices _apiServices = ApiServices();
  List<ProductModel> _newproduct;
  bool _loading = false;

  List<ProductModel> get newProduct => _newproduct;

  bool get isLoading => _loading;

  getNewProducts({search}) async {
    _loading = true;
    // notifyListeners();
    await _apiServices.getNewProducts(search: search).then((value) {
     
      _newproduct = value;
      _loading = false;
      notifyListeners();
    });
  }
}

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teatime/models/error_model.dart';
import 'package:teatime/models/product.dart';
import 'package:teatime/respositories/product_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  getProducts({search}) async {
    emit(ProductsInitial());
    try {
      final data = await ProductRepository().getProducts(search: search);
      emit(ProductsLoaded(data));
    } catch (ex) {
      if (ex is ErrorModel) {
        emit(ProductsError(ex.message));
      } else if (ex is FormatException) {
        emit(ProductsError("Invalid Response Format"));
      } else if (ex is SocketException || ex is HttpException) {
        emit(ProductsError(
            "It looks like you don't have a stable internet connection"));
      }
    }
  }

  products({search}) async {
    final data = await ProductRepository().getProducts(search: search);

    emit(ProductsLoaded(data));
  }

  emptyProducts() {
    emit(ProductsInitial());
  }
}

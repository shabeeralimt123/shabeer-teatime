part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;

  ProductsLoaded(this.products);
}
class ProductsError extends ProductsState {
  final String message;

  ProductsError(this.message);
}

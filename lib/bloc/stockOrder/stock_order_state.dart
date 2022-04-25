part of 'stock_order_cubit.dart';

@immutable
abstract class StockOrderState {}

class StockOrderInitial extends StockOrderState {}
class StockOrderLoaded extends StockOrderState {
  final List<StockModel> stockorders;

  StockOrderLoaded(this.stockorders);
}
class StockOrderError extends StockOrderState {}


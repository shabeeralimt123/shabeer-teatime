part of 'stock_order_details_cubit.dart';

@immutable
abstract class StockOrderDetailsState {}

class StockOrderDetailsInitial extends StockOrderDetailsState {}
class StockOrderDetailsLoaded extends StockOrderDetailsState {
  final List<StockItemDetails> orders;

  StockOrderDetailsLoaded(this.orders);
}
class StockOrderDetailsError extends StockOrderDetailsState {}

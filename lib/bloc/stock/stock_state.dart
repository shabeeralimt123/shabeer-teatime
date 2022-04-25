part of 'stock_cubit.dart';

@immutable
abstract class StockState {}

class StockInitial extends StockState {}
class StockLoaded extends StockState {
  final List<StockData> particulars;

  StockLoaded(this.particulars);
}
class StockError extends StockState {
  final String message;

  StockError(this.message);
}

class AddingToStock extends StockState{}
class AddedToStock extends StockState{}
class AddingToStockError extends StockState{}
class DeleteFromStock extends StockState{}
class DeletedFromStock extends StockState{}
class DeleteStockError extends StockState{}
class UpdatingStock extends StockState{}
class UpdatedStock extends StockState{}
class UpdateStockError extends StockState{}
class PostingStock extends StockState{}
class PostStockEmpty extends StockState{}
class PostedStock extends StockState{}
class PostStockError extends StockState{}

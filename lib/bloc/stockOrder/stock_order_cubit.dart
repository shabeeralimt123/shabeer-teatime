import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teatime/models/stockmodel.dart';
import 'package:teatime/respositories/stockRepository.dart';

part 'stock_order_state.dart';

class StockOrderCubit extends Cubit<StockOrderState> {
  StockOrderCubit() : super(StockOrderInitial());
  getStock() async {
    emit(StockOrderInitial());
    try{
      final data = await StockRepository().getStocks();
      emit(StockOrderLoaded(data));
    }catch(ex){
      print(ex.toString());
      emit(StockOrderError());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teatime/models/stock_item_detail_model.dart';
import 'package:teatime/respositories/stockRepository.dart';

part 'stock_order_details_state.dart';

class StockOrderDetailsCubit extends Cubit<StockOrderDetailsState> {
  StockOrderDetailsCubit() : super(StockOrderDetailsInitial());
  getStockOrderDetails(poId) async {
    emit(StockOrderDetailsInitial());
    try{
      final data = await StockRepository().getStockDetails(poId);
      emit(StockOrderDetailsLoaded(data));
    }catch(ex){
      emit(StockOrderDetailsError());
    }
  }
}

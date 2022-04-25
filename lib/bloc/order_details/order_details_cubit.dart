import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teatime/models/order_item_detail_model.dart';
import 'package:teatime/respositories/order_repository.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());

  getOrderDetails(poId) async {
    emit(OrderDetailsInitial());
    try{
      final data = await OrderRepository().getOrderDetails(poId);
      emit(OrderDetailsLoaded(data));
    }catch(ex){
      emit(OrderDetailsError());
    }
  }
}

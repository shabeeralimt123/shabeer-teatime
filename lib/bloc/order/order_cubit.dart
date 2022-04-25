import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teatime/models/order_model.dart';
import 'package:teatime/respositories/order_repository.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  getOrders() async {
    emit(OrderInitial());
    try{
      final data = await OrderRepository().getOrders();
      emit(OrderLoaded(data));
    }catch(ex){
      print(ex.toString());
      emit(OrderError());
    }
  }
}

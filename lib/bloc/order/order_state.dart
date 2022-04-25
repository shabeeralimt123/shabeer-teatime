part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
class OrderLoaded extends OrderState {
  final List<OrderModel> orders;

  OrderLoaded(this.orders);
}
class OrderError extends OrderState {}

part of 'order_details_cubit.dart';

@immutable
abstract class OrderDetailsState {}

class OrderDetailsInitial extends OrderDetailsState {}
class OrderDetailsLoaded extends OrderDetailsState {
  final List<OrderDetailItemModel> orders;

  OrderDetailsLoaded(this.orders);
}
class OrderDetailsError extends OrderDetailsState {}

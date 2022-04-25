part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class CartLoaded extends CartState {
  final List<Particular> particulars;

  CartLoaded(this.particulars);
}
class CartError extends CartState {
  final String message;

  CartError(this.message);
}

class AddingToCart extends CartState{}
class AddedToCart extends CartState{}
class AddingToCartError extends CartState{}
class DeleteFromCart extends CartState{}
class DeletedFromCart extends CartState{}
class DeleteCartError extends CartState{}
class UpdatingCart extends CartState{}
class UpdatedCart extends CartState{}
class UpdateCartError extends CartState{}
class PostingCart extends CartState{}
class PostEmpty extends CartState{}
class PostedCart extends CartState{}
class PostCartError extends CartState{}
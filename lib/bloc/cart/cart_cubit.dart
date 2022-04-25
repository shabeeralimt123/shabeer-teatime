import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:moor/moor.dart';
import 'package:teatime/database/database.dart';
import 'package:teatime/models/product.dart';
import 'package:teatime/respositories/order_repository.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  getCart(BuildContext context) async {
    emit(CartInitial());
    final db = RepositoryProvider.of<MyDatabase>(context);
    final data = await db.getParticulars();
    emit(CartLoaded(data));
  }

  insertIntoCart(
      BuildContext context, ProductModel productModel, String qty,int unitId,String unitName) async {
    emit(AddingToCart());
    try {
      print(qty);

      final db = RepositoryProvider.of<MyDatabase>(context);
      await db.addParticular(ParticularsCompanion(
        qty: Value(qty),
        name: Value(productModel.name),
        product: Value(productModel.id),
        supplier: Value(productModel.supplier),
        unit: Value(unitId),
        unitname: Value(unitName),
      ));
      emit(AddedToCart());
    } catch (ex) {
      print(ex.toString());
      emit(AddingToCartError());
    }
    this.getCart(context);
  }

  updateCartItem(BuildContext context, int id,  qty,int unitId,String name) async {
    emit(UpdatingCart());
    try {
      final db = RepositoryProvider.of<MyDatabase>(context);
      await db.updateParticular(id, qty,int.parse(unitId.toString()),name);
      emit(UpdatedCart());
    } catch (ex) {
      print(ex.toString());
      emit(UpdateCartError());
    }
    this.getCart(context);
  }

  deleteFromCart(BuildContext context, int id) async {
    emit(DeleteFromCart());
    try {
      final db = RepositoryProvider.of<MyDatabase>(context);
      await db.deleteItem(id);
      emit(DeletedFromCart());
    } catch (ex) {
      emit(DeleteCartError());
    }
    this.getCart(context);
  }

  checkOutCart(BuildContext context) async {
    emit(PostingCart());
    try {
      final db = RepositoryProvider.of<MyDatabase>(context);
      final data = await db.getParticulars();
      if (data.length > 0) {
        List<Map<String, String>> d = [];
        data.forEach((element) {
          d.add({
            'product': element.product.toString(),
            'qty': element.qty.toString(),
            'unit': element.unit.toString(),
            'supplier': element.supplier.toString(),
          });
        });

        await OrderRepository().postOrder(d);
        await db.deleteAll();
        emit(PostedCart());
      } else {
        emit(PostEmpty());
      }
    } catch (ex) {
      print(ex.toString());
      emit(PostCartError());
    }
    this.getCart(context);
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:teatime/database/stock_database.dart';
import 'package:teatime/models/product.dart';

import 'package:teatime/respositories/stockRepository.dart';

part 'stock_state.dart';

class StockCubit extends Cubit<StockState> {
  StockCubit() : super(StockInitial());
  getStock(BuildContext context) async {
    emit(StockInitial());
    final db = RepositoryProvider.of<Stockdatabase>(context);
    final data = await db.getStock();
    emit(StockLoaded(data));
  }

  insertIntoStock(
    BuildContext context,
    ProductModel productModel,
    double ctnqty,
    
    double pcsqty,
   
    int id,
    String productName,
  ) async {
    emit(AddingToStock());
    try {
      final db = RepositoryProvider.of<Stockdatabase>(context);
      await db.addStock(StockCompanion(
        name: Value(productModel.name),
        product: Value(productModel.id),
        supplier: Value(productModel.supplier),
        ctnqty: Value(ctnqty.toString()),
       
        pcsqty: Value(pcsqty.toString()),
        
        unit: Value(id),
        unitname: Value(productName),
      ));
      emit(AddedToStock());
    } catch (ex) {
      print(ex.toString());
      emit(AddingToStockError());
    }

    this.getStock(context);
  }

  updateStockItem(
    BuildContext context,
    int id,
    double ctnqty,
   
    double pcsqty,
    
  ) async {
    emit(UpdatingStock());
    try {
      final db = RepositoryProvider.of<Stockdatabase>(context);
      await db.updateStock(
          id,
          ctnqty.toString(),
          
          pcsqty.toString(),
          );
      emit(UpdatedStock());
    } catch (ex) {
      print(ex.toString());
      emit(UpdateStockError());
    }
    this.getStock(context);
  }

  deleteFromStock(BuildContext context, int id) async {
    emit(DeleteFromStock());
    try {
      final db = RepositoryProvider.of<Stockdatabase>(context);
      await db.deleteStockItem(id);
      emit(DeletedFromStock());
    } catch (ex) {
      emit(DeleteStockError());
    }
    this.getStock(context);
  }

  checkOutStock(BuildContext context) async {
    emit(PostingStock());
    try {
      final db = RepositoryProvider.of<Stockdatabase>(context);
      final data = await db.getStock();
      if (data.length > 0) {
        List<Map<String, dynamic>> d = [];
        data.forEach((element) {
          d.add({
            'item_id': element.product,
            'ctn_qty': double.tryParse(element.ctnqty),
           
            'pcs_qty': double.tryParse(element.pcsqty),
           
          });
        });

        await StockRepository().postStock(d);
        await db.deleteAll();
        emit(PostedStock());
      } else {
        emit(PostStockEmpty());
      }
    } catch (ex) {
      print(ex.toString());
      emit(PostStockError());
    }
    this.getStock(context);
  }
}

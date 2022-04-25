import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teatime/models/unit_model.dart';
import 'package:teatime/models/error_model.dart';
import 'dart:io';

import 'package:teatime/respositories/unit_repositories.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  UnitCubit() : super(UnitInitial());

  getUnits({int id: 0}) async {
    print(id.toString());
    emit(UnitInitial());
    try {
      final data = await UnitRepository().getunits();
      UnitModel selectedUnit;
      if(id!=0){
        selectedUnit = data.singleWhere((e)=>e.id==id);
      }
      emit(UnitLoaded(data, selectedUnit));
    } catch (ex) {
      if (ex is ErrorModel) {
        emit(UnitError(ex.message));
      } else if (ex is FormatException) {
        emit(UnitError("Invalid Response Format"));
      } else if (ex is SocketException || ex is HttpException) {
        emit(UnitError(
            "It looks like you don't have a stable internet connection"));
      }
    }
  }
}

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teatime/models/branch.dart';
import 'package:teatime/models/error_model.dart';
import 'package:teatime/respositories/branch_repository.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  BranchCubit() : super(BranchInitial());

  getBranches() async {
    try{
      final data = await BranchRepository().getBranches();
      emit(BranchLoaded(data,null,data));
    }catch(ex){
      if(ex is ErrorModel){
        emit(BranchError(ex.message));
      }else if (ex is FormatException){
        emit(BranchError("Invalid Response Format"));
      }else if(ex is SocketException || ex is HttpException){
        emit(BranchError("It looks like you don't have a stable internet connection"));
      }else {
        emit(BranchError(ex.toString()));
      }
    }
  }
  selectBranch(BranchModel branch){
    if(state.branch==branch){
      emit(BranchLoaded(state.branches, null,state.branches));
    }else{
      emit(BranchLoaded(state.branches, branch,state.branches));
    }
  }

  search(String val){
    if(val.isEmpty){
      emit(BranchLoaded(state.tempBranches,null,state.tempBranches));
    }else{
      final List<BranchModel> filtered = state.tempBranches.where((e)=>e.name.toLowerCase().contains(val.toLowerCase())).toList();
      emit(BranchLoaded(filtered,null,state.tempBranches));
    }

  }
}

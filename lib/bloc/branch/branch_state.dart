part of 'branch_cubit.dart';

@immutable
abstract class BranchState {
  final BranchModel branch;
  final List<BranchModel> branches;
  final List<BranchModel> tempBranches;

  BranchState(this.branches,this.branch,this.tempBranches);
}

class BranchInitial extends BranchState {

  BranchInitial():super([],null,[]);

}
class BranchLoaded extends BranchState {
  final List<BranchModel> branches;
  final BranchModel branch;
  final List<BranchModel> tempBranches;

  BranchLoaded(this.branches,this.branch,this.tempBranches):super(branches,branch,tempBranches);

}
class BranchError extends BranchState {
  final String message;

  BranchError(this.message) : super([],null,[]);
}

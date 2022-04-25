part of 'unit_cubit.dart';

@immutable
abstract class UnitState {}

class UnitInitial extends UnitState {}

class UnitLoaded extends UnitState {
  final List<UnitModel> units;
  final UnitModel unit;

  UnitLoaded(this.units, this.unit);
}

class UnitError extends UnitState {
  final String message;

  UnitError(this.message);
}

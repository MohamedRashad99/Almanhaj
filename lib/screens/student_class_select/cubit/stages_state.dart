part of 'stages_cubit.dart';

@immutable
abstract class StagesState {}

class StagesInitial extends StagesState {}

class StagesLoading extends StagesState {}

class StagesSuccess extends StagesState {
  final List<Stages>stages ;
  StagesSuccess(this.stages);
}

class StagesError extends StagesState {
  final String msg;

  StagesError(this.msg);
}

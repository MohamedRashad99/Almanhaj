part of 'list_of_newest_added_cubit.dart';

@immutable
abstract class ListOfNewestAddedState {}

class ListOfNewestAddedInitial extends ListOfNewestAddedState {}
class ListOfNewestAddedLoading extends ListOfNewestAddedState {}
class ListOfNewestAddedSuccess extends ListOfNewestAddedState {}
class ListOfNewestAddedError extends ListOfNewestAddedState {
  final String msg;
  ListOfNewestAddedError(this.msg);
}

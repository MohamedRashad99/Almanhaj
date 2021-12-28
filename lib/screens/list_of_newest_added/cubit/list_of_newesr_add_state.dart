part of 'list_of_newesr_add_cubit.dart';

@immutable
abstract class ListOfNewestAddState {}

class ListOfNewestAddInitial extends ListOfNewestAddState {}
class ListOfNewestAddLoading extends ListOfNewestAddState {}
class ListOfNewestAddLoadMore extends ListOfNewestAddState {
  final List<ListOfNewestAddModel>listOfNewestAddModel ;
  ListOfNewestAddLoadMore({required this.listOfNewestAddModel});
}
class ListOfNewestAddSuccess extends ListOfNewestAddState {
  final List<ListOfNewestAddModel> listOfNewestAddModel;
  ListOfNewestAddSuccess({required this.listOfNewestAddModel});
}
class ListOfNewestAddError extends ListOfNewestAddState {
  final String msg ;

  ListOfNewestAddError(this.msg);

}
part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchIsEmpty extends SearchState {}
class SearchSuccess extends SearchState {
  List<SearchModel> searchModel;
  SearchSuccess({required this.searchModel});
}
class SearchError extends SearchState {
  final String msg;

  SearchError(this.msg);
}

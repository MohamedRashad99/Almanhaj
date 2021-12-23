import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_of_newest_added_state.dart';

class ListOfNewestAddedCubit extends Cubit<ListOfNewestAddedState> {
  ListOfNewestAddedCubit() : super(ListOfNewestAddedInitial());
}

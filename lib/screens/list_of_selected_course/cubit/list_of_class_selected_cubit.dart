import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_of_class_selected_state.dart';

class ListOfClassSelectedCubit extends Cubit<ListOfClassSelectedState> {
  ListOfClassSelectedCubit() : super(ListOfClassSelectedInitial());
}

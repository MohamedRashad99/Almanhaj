import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sections_names_state.dart';

class SectionsNamesCubit extends Cubit<SectionsNamesState> {
  SectionsNamesCubit() : super(SectionsNamesInitial());
}

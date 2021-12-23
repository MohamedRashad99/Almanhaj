import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_section_selected_state.dart';

class UserSectionSelectedCubit extends Cubit<UserSectionSelectedState> {
  UserSectionSelectedCubit() : super(UserSectionSelectedInitial());
}

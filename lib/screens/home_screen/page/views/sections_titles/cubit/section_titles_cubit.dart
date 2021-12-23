import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'section_titles_state.dart';

class SectionTitlesCubit extends Cubit<SectionTitlesState> {
  SectionTitlesCubit() : super(SectionTitlesInitial());
}

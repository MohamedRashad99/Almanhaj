import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'section_titles_state.dart';

class SectionTitlesCubit extends Cubit<SectionTitlesState> {
  SectionTitlesCubit() : super(SectionTitlesInitial());

  static SectionTitlesCubit of(context){
   return  BlocProvider.of(context);
  }



}

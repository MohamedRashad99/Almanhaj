part of 'section_titles_cubit.dart';

@immutable
abstract class SectionTitlesState {}

class SectionTitlesInitial extends SectionTitlesState {}
class SectionTitlesLoading extends SectionTitlesState {}
class SectionTitlesSuccess extends SectionTitlesState {}
class SectionTitlesError extends SectionTitlesState {
  final String msg;

  SectionTitlesError(this.msg);
}

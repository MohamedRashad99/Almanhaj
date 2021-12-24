part of 'sections_names_cubit.dart';

@immutable
abstract class SectionsNamesState {}

class SectionsNamesInitial extends SectionsNamesState {}

class SectionsNamesLoading extends SectionsNamesState {}
class SectionsNamesEmpty extends SectionsNamesState {}

class SectionsNamesSuccess extends SectionsNamesState {
  final List<SectionsNames> sectionsNames;

  SectionsNamesSuccess({required this.sectionsNames});
}

class SectionsNamesError extends SectionsNamesState {
  final String msg;

  SectionsNamesError({required this.msg});
}

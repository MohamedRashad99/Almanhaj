part of 'all_sections_notes_cubit.dart';

@immutable
abstract class AllSectionsNotesState {}

class AllSectionsNotesInitial extends AllSectionsNotesState {}

class AllSectionsNotesLoading extends AllSectionsNotesState {}

class AllSectionsNotesSuccess extends AllSectionsNotesState {
  final List<AllSectionSNotes> allSectionSNotes;

  AllSectionsNotesSuccess({required this.allSectionSNotes});
}

class AllSectionsNotesError extends AllSectionsNotesState {
  final String msg;

  AllSectionsNotesError({required this.msg});
}

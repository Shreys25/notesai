part of 'notes_bloc.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesImportSuccess extends NotesState {
  final List<NotesModel> notes;

  NotesImportSuccess(this.notes);

  List<Object?> get props => [notes];
}

final class NotesFetchFailure extends NotesState {
  final String error;

  NotesFetchFailure(this.error);
}

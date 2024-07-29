part of 'notes_bloc.dart';

@immutable
sealed class NotesEvent {
  List<Object?> get props => [];
}

final class NotesUpload extends NotesEvent {
  final String date;
  final String time;
  final String content;
  final String category;
  final String level;

  NotesUpload(
    this.date,
    this.time,
    this.content,
    this.category,
    this.level,
  );
}

final class NotesFetch extends NotesEvent {}

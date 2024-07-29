import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/notes_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NotesInitial()) {
    on<NotesEvent>((event, emit) => emit(NotesLoading()));
    on<NotesFetch>(_onNotesImport);
  }

  void _onNotesImport(NotesFetch event, Emitter<NotesState> emit) async {
    try {
      final response = await http.get(Uri.parse(
          'https://script.google.com/macros/s/AKfycbyUHKQCoyXNEIr9TxOTUQ1nDQxLdXTGRqSHkf08m2GlX9ZzUvC3QPXLPt2hVKfV6zR2/exec'));
      //https://script.google.com/macros/s/AKfycbyUHKQCoyXNEIr9TxOTUQ1nDQxLdXTGRqSHkf08m2GlX9ZzUvC3QPXLPt2hVKfV6zR2/exec
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print('${data.toString()}');
        List<NotesModel> feedbacks =
            data.map((json) => NotesModel.fromJson(json)).toList();
        emit(NotesImportSuccess(feedbacks));
      } else {
        emit(NotesFetchFailure('Failed to load feedback'));
      }
    } catch (e) {
      emit(NotesFetchFailure(e.toString()));
    }
  }

  void _onNotesUpload(NotesUpload event, Emitter<NotesState> emit) async {
    //final res=
  }
}

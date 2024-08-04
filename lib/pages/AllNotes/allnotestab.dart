import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/notes_bloc.dart';
import '../../models/notes_model.dart';

class AllNotesTab extends StatefulWidget {
  const AllNotesTab({super.key});

  @override
  State<AllNotesTab> createState() => _AllNotesTabState();
}

class _AllNotesTabState extends State<AllNotesTab> {
  @override
  void initState() {
    super.initState();
    context.read<NotesBloc>().add(NotesFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state is NotesInitial) {
            return Center(child: Text('Welcome'));
          } else if (state is NotesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NotesImportSuccess) {
            return ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                NotesModel feedback = state.notes[index];
                return ListTile(
                  title: Text(feedback.content),
                  subtitle: Text('${feedback.date} - ${feedback.time}'),
                );
              },
            );
          } else if (state is NotesFetchFailure) {
            return Center(child: Text(state.error));
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

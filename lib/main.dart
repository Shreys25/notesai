import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:notesai/core/constants/secrets.dart';
import 'package:notesai/pages/AiTab/bloc/chat_bloc_bloc.dart';
import 'package:notesai/pages/AllNotes/bloc/notes_bloc.dart';
import 'package:notesai/pages/tabmanager.dart';

void main() {
  Gemini.init(apiKey: geminiAPIKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => NotesBloc(),
            ),
            BlocProvider(
              create: (context) => ChatBlocBloc(),
            ),
          ],
          child: TabManager(),
        ));
  }
}

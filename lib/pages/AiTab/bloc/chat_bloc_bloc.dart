import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
part 'chat_bloc_event.dart';
part 'chat_bloc_state.dart';

class ChatBlocBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  final Gemini _gemini = Gemini.instance;
  final List<ChatMessage> _messages = [];
  final ChatUser _user = ChatUser(id: '1', firstName: 'User');
  final ChatUser _bot = ChatUser(id: '2', firstName: 'Gemini');
  ChatBlocBloc() : super(ChatBlocInitial()) {
    on<SendMessage>(_onSendMessage);
  }
  Future<void> _onSendMessage(
      SendMessage event, Emitter<ChatBlocState> emit) async {
    final message = ChatMessage(
      user: _user,
      text: event.message,
      createdAt: DateTime.now(),
    );

    _messages.insert(0, message);
    emit(ChatLoaded(List.from(_messages)));

    try {
      final botResponse = await _gemini.text(event.message);
      final botMessage = ChatMessage(
        user: _bot,
        text: botResponse!.content!.parts!.last.toString(),
        createdAt: DateTime.now(),
      );

      _messages.insert(0, botMessage);
      emit(ChatLoaded(List.from(_messages)));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}

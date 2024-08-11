import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../core/constants/constants.dart';

part 'chat_bloc_event.dart';
part 'chat_bloc_state.dart';

class ChatBlocBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  String apiKey = Constants.apiKey;
  late final GenerativeModel model;
  //static const apiMy = '';

  ChatBlocBloc() : super(ChatBlocInitial()) {
    model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    on<SendMessageEvent>(_onSendMessage);
  }
  Future<void> _onSendMessage(
      SendMessageEvent event, Emitter<ChatBlocState> emit) async {
    final userMessage =
        Message(isUser: true, message: event.message, date: DateTime.now());

    if (state is ChatLoaded) {
      final updatedMessages = List<Message>.from((state as ChatLoaded).messages)
        ..add(userMessage);
      emit((state as ChatLoaded).copyWith(messages: updatedMessages));
    } else {
      emit(ChatLoaded(messages: [userMessage]));
    }

    final content = [Content.text(event.message)];
    final response = await model.generateContent(content);

    final botMessage = Message(
        isUser: false, message: response.text ?? "", date: DateTime.now());

    if (state is ChatLoaded) {
      final updatedMessages = List<Message>.from((state as ChatLoaded).messages)
        ..add(botMessage);
      emit((state as ChatLoaded).copyWith(messages: updatedMessages));
    }
  }
}

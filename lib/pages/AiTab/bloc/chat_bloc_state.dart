part of 'chat_bloc_bloc.dart';

@immutable
sealed class ChatBlocState {
  const ChatBlocState();
  //@override
  List<Object> get props => [];
}

final class ChatBlocInitial extends ChatBlocState {}

class ChatLoading extends ChatBlocState {}

//to do when the chat response is received
class ChatLoaded extends ChatBlocState {
  final List<Message> messages;

  const ChatLoaded({this.messages = const []});

  ChatLoaded copyWith({List<Message>? messages}) {
    return ChatLoaded(messages: messages ?? this.messages);
  }

  @override
  List<Object> get props => [messages];
}

class Message {
  final bool isUser;
  final String message;
  final DateTime date;

  Message({required this.isUser, required this.message, required this.date});
}

// check for error and handle it
class ChatError extends ChatBlocState {
  final String error;

  const ChatError(this.error);

  @override
  List<Object> get props => [error];
}

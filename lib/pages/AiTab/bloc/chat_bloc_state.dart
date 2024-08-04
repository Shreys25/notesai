part of 'chat_bloc_bloc.dart';

@immutable
sealed class ChatBlocState {
  const ChatBlocState();
  @override
  List<Object> get props => [];
}

final class ChatBlocInitial extends ChatBlocState {}

class ChatLoading extends ChatBlocState {}

class ChatLoaded extends ChatBlocState {
  final List<ChatMessage> messages;

  const ChatLoaded(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatError extends ChatBlocState {
  final String error;

  const ChatError(this.error);

  @override
  List<Object> get props => [error];
}

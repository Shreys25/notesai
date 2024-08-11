part of 'chat_bloc_bloc.dart';

@immutable
sealed class ChatBlocEvent {
  const ChatBlocEvent();
  List<Object?> get props => [];
}

class SendMessageEvent extends ChatBlocEvent {
  final String message;

  const SendMessageEvent(this.message);

  @override
  List<Object> get props => [message];
}

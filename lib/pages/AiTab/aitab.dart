import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/chat_bloc_bloc.dart';

class AiTab extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  AiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBlocBloc, ChatBlocState>(
              builder: (context, state) {
                if (state is ChatBlocInitial) {
                  return Center(child: Text('Start a conversation'));
                } else if (state is ChatLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ChatLoaded) {
                  return DashChat(
                    currentUser: ChatUser(id: '1', firstName: 'User'),
                    messages: state.messages,
                    onSend: (ChatMessage message) {
                      context
                          .read<ChatBlocBloc>()
                          .add(SendMessage(message.text));
                    },
                  );
                } else if (state is ChatError) {
                  return Center(child: Text('Error: ${state.error}'));
                } else {
                  return Container();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(hintText: 'Type a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final message = _textController.text;
                    if (message.isNotEmpty) {
                      context.read<ChatBlocBloc>().add(SendMessage(message));
                      _textController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

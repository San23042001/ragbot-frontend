import 'package:flutter/material.dart';
import 'package:network/api_client.dart';
import 'package:core/core.dart'; // AskRequest + Logger
import 'package:ui/widgets/custom_button.dart';
import 'package:ui/widgets/message_bubble.dart';
import 'package:ui/widgets/typing_indicator.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final ApiClient _apiClient = ApiClient();

  final List<_ChatMessage> _messages = [];
  bool _isTyping = false;

  void _sendMessage() async {
    final url = _urlController.text.trim();
    final question = _questionController.text.trim();

    if (url.isEmpty || question.isEmpty) return;

    setState(() {
      _messages.add(_ChatMessage(question, true));
      _questionController.clear();
      _isTyping = true;
    });

    try {
      final request = AskRequest(url: url, question: question);
      final answer = await _apiClient.ask(request);

      setState(() {
        _messages.add(_ChatMessage(answer, false));
        _isTyping = false;
      });
    } catch (e) {
      logError("CHAT_SCREEN", e.toString());
      setState(() {
        _messages.add(_ChatMessage("Failed to get response", false));
        _isTyping = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RagBot')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return MessageBubble(message: msg.text, isUser: msg.isUser);
              },
            ),
          ),
          if (_isTyping)
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TypingIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _urlController,
                  decoration: const InputDecoration(
                    hintText: 'Enter website URL',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _questionController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your question',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CustomButton(label: 'Send', onPressed: _sendMessage),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;

  _ChatMessage(this.text, this.isUser);
}

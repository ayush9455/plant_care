import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<Map<String, dynamic>> _messages = [
    // {
    //   'text': 'Hi , I Have Got Issue In Cropping !',
    //   'sender': 'Raju', // Replace with actual user name or id
    // }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Plant Care',
            style: TextStyle(fontWeight: FontWeight.bold, shadows: [
              Shadow(color: Colors.grey, blurRadius: 4, offset: Offset(1, 1))
            ])),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 90),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color.fromARGB(255, 37, 170, 70),
              Color.fromARGB(0, 11, 138, 143)
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: Alignment.bottomRight,
                    child: ListTile(
                      title: Text(message['text']),
                      subtitle: Text(message['sender']),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Enter your message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      _sendMessage();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    final messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      final newMessage = {
        'text': messageText,
        'sender': 'You', // Replace with actual user name or id
      };
      setState(() {
        _messages.insert(0, newMessage);
      });
      _messageController.clear();
    }
  }
}

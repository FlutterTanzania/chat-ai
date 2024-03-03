/*
This page if for the single chat room for users to send and receive messages
*/

import 'package:chatai/components/index.dart';
import 'package:chatai/screens/message_input.dart';
import 'package:chatai/utils/index.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  // for screen size
  late Size screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = Layout.getSize(context);
  }

  // for message reply
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //appbar
      appBar: HeaderAppBar(
        backgroundColor: const Color(0xFF202020),
        title: "Chat AI",
        centerTitle: false,
        topPadding: 0,
      ),

      //body
      body: Column(
        children: [
          // in the first section we display messages
          //list of messages

          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const ChatMessage(
                  isSentByUser: true,
                  message: "Hello here",
                  time: "",
                );
              },
            ),
          ),

          // input for user to type message and send
          const MessageInput(),
        ],
      ),
    );
  }
}

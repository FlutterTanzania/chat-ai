/*
This page if for the single chat room for users to send and receive messages
*/

import 'package:chatai/components/index.dart';
import 'package:chatai/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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

  // controller of text
  final TextEditingController _textEditingController = TextEditingController();

  // a bool value if text size is valid
  late bool textValid = false;

  final String apikey = dotenv.env['API_KEY']!;

  late List<Map<String, dynamic>> messages = [];

  late bool loading = false;

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
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, dynamic> value = messages[index];
                return ChatMessage(
                  isSentByUser: value['sender'],
                  message: value['message'],
                );
              },
            ),
          ),

          // input for user to type message and send
          Padding(
            padding: EdgeInsets.only(
              left: Layout.getWidth(30),
              right: Layout.getWidth(30),
              bottom: Layout.getWidth(20),
            ),

            //
            child: Row(
              children: [
                // input
                Expanded(
                  child: TextInput(
                    textEditingController: _textEditingController,
                    placeholder: "Type a message...",
                    borderRadious: 100,
                    filled: true,
                    filledColor: const Color(0xFFEDEDED),
                    suffixTransform: 0.7,
                    onChanged: (value) {
                      // update if text is valid as keyboard is typed
                      if (value.trim().length > 4) {
                        setState(() {
                          textValid = true;
                        });
                      } else {
                        setState(() {
                          textValid = false;
                        });
                      }
                    },
                  ),
                ),

                // send icon
                // check if is loading and display a loadier
                loading
                    ? Padding(
                        padding: EdgeInsets.only(left: Layout.getWidth(27)),
                        child: LoadingAnimationWidget.inkDrop(
                          color: Colors.black,
                          size: Layout.getHeight(20),
                        ),
                      )
                    : Transform.rotate(
                        angle: 0.7,
                        child: IconButton(
                          icon: Icon(
                            CupertinoIcons.paperplane_fill,

                            // we check if input is more that five text we send
                            color: textValid ? Colors.black : Styles.greyColor,
                          ),
                          onPressed: () {
                            // we check if input is more that five text we send an sms
                            if (textValid) _sendMessage();
                          },
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // function to send an SMS
  void _sendMessage() async {
    // insert to our message variable
    // this is the user who sent the message
    setState(() {
      loading = true;
      messages.add({"sender": true, "message": _textEditingController.text});
      textValid = false;
    });

    //
    // initialize model
    final model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apikey,
    );

    // initialize chat
    final chat = model.startChat(history: [
      Content.text(
        "You're name is Proc, you'll be chatting with cool people here",
      ),
      Content.model(
        [TextPart('Hey welcome, how can I help you')],
      )
    ]);

    // send a new text
    var content = Content.text(_textEditingController.text);
    await chat.sendMessage(content).then((value) {
      // clear a input value from the user
      // the add the response message to the messages
      setState(() {
        // clear
        _textEditingController.clear();

        // add response
        messages.add({"sender": false, "message": value.text});
        loading = false;
      });
    });
  }
}

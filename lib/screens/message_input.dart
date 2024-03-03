/*
This widget is for user to input message to be sent
*/

import 'package:chatai/components/index.dart';
import 'package:chatai/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({
    super.key,
  });

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  // controller of text
  final TextEditingController _textEditingController = TextEditingController();

  // a bool value if text size is valid
  late bool textValid = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: Layout.getWidth(30),
          right: Layout.getWidth(30),
          bottom: Layout.getWidth(20),
        ),

        //
        child: Row(
          children: [
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
                  if (value.length > 5) {
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
            Transform.rotate(
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
        ));
  }

  // function to send an SMS
  void _sendMessage() {}
}

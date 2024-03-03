import 'package:chatai/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/*
This widget is for displaying single message in the chart room
*/

class ChatMessage extends StatefulWidget {
  final bool isSentByUser;
  final String message;
  const ChatMessage({
    super.key,
    required this.isSentByUser,
    required this.message,
  });

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  // for screen size
  late Size screenSize;

  // this variable is for the channel name
  // we pass user details in metedata of the channel on the creation,
  // so we check key, which are userIds and take the key which is not an ID of the current user

  // receiver image and blur
  late final String profileImage;
  late final String imageBlur;

  // sender image and blur
  late final String senderProfileImage;
  late final String senderImageBlur;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = Layout.getSize(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Layout.getWidth(10),
        right: Layout.getWidth(10),
        top: Layout.getHeight(5),
      ),
      child: Row(
        // check who sent message and align message according
        mainAxisAlignment: widget.isSentByUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,

        crossAxisAlignment: CrossAxisAlignment.end,

        //
        children: [
          // if user sent, display on left

          const SizedBox(),

          // message sent
          Gap(Layout.getWidth(5)),
          Container(
            padding: EdgeInsets.all(
              Layout.getWidth(10),
            ),

            // focr setting message width
            constraints: BoxConstraints(
              maxWidth: screenSize.width * 0.65,
            ),

            // style
            decoration: BoxDecoration(
              // display color according to the user who sent
              color: widget.isSentByUser
                  ? const Color.fromRGBO(233, 233, 233, 0.57)
                  : const Color.fromRGBO(251, 241, 255, 0.57),

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Layout.getHeight(20)),
                topRight: Radius.circular(Layout.getHeight(20)),
                bottomLeft: widget.isSentByUser
                    ? Radius.circular(Layout.getHeight(20))
                    : const Radius.circular(0.0),
                bottomRight: widget.isSentByUser
                    ? const Radius.circular(0.0)
                    : Radius.circular(Layout.getHeight(20)),
              ),
            ),

            //
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // message
                Text(
                  widget.message,
                  style: Styles.normalText.copyWith(
                    fontSize: Layout.getHeight(13),
                    color: Colors.black,
                  ),
                ),

                // time message semt
                // Text(
                //   widget.time,
                //   style: Styles.normalText.copyWith(
                //     fontSize: Layout.getHeight(8),
                //     color: Styles.textGrey,
                //   ),
                // ),
              ],
            ),
          ),

          // if user sent
          Gap(Layout.getWidth(5)),
          const SizedBox(),
        ],
      ),
    );
  }
}

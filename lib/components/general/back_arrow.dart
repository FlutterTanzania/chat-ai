/*
A back arrow for navigating to back screen
*/

import 'package:flutter/material.dart';
import 'package:chatai/utils/index.dart';

Widget backArrow({
  required BuildContext context,
  IconData icon = Icons.arrow_back_rounded,
}) {
  return GestureDetector(
    onTap: () {},

    // add border with a radious
    child: Container(
      //
      // padding
      // padding: EdgeInsets.all(Layout.getWidth(4)),
      width: 5,
      height: 5,

      // style
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: Layout.getWidth(1), color: Styles.greyColor),
        borderRadius: BorderRadius.circular(Layout.getWidth(50)),
      ),

      // icon
      child: Icon(
        icon,
        size: Layout.getHeight(20),
      ),
    ),
  );
}

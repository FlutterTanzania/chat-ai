import 'package:flutter/material.dart';
import 'package:chatai/utils/index.dart';

/* 
The main appbar for the app
 */

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final double? leadingWidth;
  final double? toolbarHeight;
  final double? horizotalPadding;
  final double? topPadding;
  final double? titleFontSize;
  final bool? isBold;
  final bool? centerTitle;
  final Color? backgroundColor;
  HeaderAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.leadingWidth,
    this.toolbarHeight,
    this.horizotalPadding,
    this.topPadding,
    this.titleFontSize,
    this.isBold,
    this.centerTitle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Layout.getWidth(horizotalPadding ?? 0),
        right: Layout.getWidth(horizotalPadding ?? 0),
        top: Layout.getHeight(topPadding ?? 5),
      ),
      child: AppBar(
        backgroundColor: backgroundColor ?? Colors.white,
        // foregroundColor: Colors.white,
        // shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        toolbarHeight: Layout.getHeight(toolbarHeight ?? 40),
        elevation: 0,
        leading: leading,
        leadingWidth: leadingWidth,
        title: Text(
          title ?? "",
          style: isBold != null
              ? Styles.header.copyWith(
                  fontSize: Layout.getHeight(titleFontSize ?? 14),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )
              : Styles.normalText.copyWith(
                  fontSize: Layout.getHeight(titleFontSize ?? 14),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
        ),
        centerTitle: centerTitle ?? false,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

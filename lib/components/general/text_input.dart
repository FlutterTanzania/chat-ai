import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:chatai/utils/index.dart';

/* 
App main input 
 */

class TextInput extends StatefulWidget {
  final String? header;
  final String placeholder;
  final double? padding;
  final bool? isReadOnly; // used for non inputs type
  final bool? filled;
  final Color? filledColor; // for filled input, use this
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? suffixSize; //if icons size is specific use this
  final double? prefixSize; // same here
  final Color? suffixColor;
  final Color? prefixColor;
  final double? placeholderPadding;
  final Color? borderColor;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final double? hintSize;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? labelText;
  final Color? labelTextColor;
  final TextEditingController? textEditingController; // input controller
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final double? borderRadious;
  final double? suffixTransform; // for rotating suffix
  final Color? hintColor;
  const TextInput({
    super.key,
    required this.placeholder,
    this.header,
    this.padding,
    this.isReadOnly,
    this.filled,
    this.filledColor,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixSize,
    this.suffixSize,
    this.prefixColor,
    this.suffixColor,
    this.placeholderPadding,
    this.borderColor,
    this.maxLines,
    this.keyboardType,
    this.textInputAction,
    this.hintSize,
    this.floatingLabelBehavior,
    this.labelText,
    this.labelTextColor,
    this.textEditingController,
    this.onChanged,
    this.focusNode,
    this.maxLength,
    this.inputFormatters,
    this.initialValue,
    this.onTap,
    this.borderRadious,
    this.suffixTransform,
    this.hintColor,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Layout.getWidth(widget.padding ?? 0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header, if header is null no text
          widget.header != null
              ? Text(
                  widget.header ?? "",
                  style: Styles.normalText.copyWith(
                    fontSize: Layout.getHeight(14),
                    fontWeight: FontWeight.w500,
                  ),
                )
              : const SizedBox(),

          // if header is null, no height from header text
          Gap(Layout.getHeight(widget.header != null ? 10 : 0)),

          // input
          TextFormField(
            maxLength: widget.maxLength,
            readOnly: widget.isReadOnly ?? false,
            cursorColor: Styles.greyColor,

            // function for when input data
            onChanged: widget.onChanged,
            focusNode: widget.focusNode,
            onTap: widget.onTap,

            // for textarea inputs
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            maxLines: widget.maxLines,
            keyboardType: widget.keyboardType,
            minLines: widget.maxLines,

            // input controller
            controller: widget.textEditingController,

            // formatter
            inputFormatters: widget.inputFormatters,

            // input style
            style: Styles.normalText,

            // initial value
            initialValue: widget.initialValue,
            //
            decoration: InputDecoration(
              filled: widget.filled ?? false,
              fillColor: widget.filledColor ?? Colors.white,
              contentPadding: EdgeInsets.only(
                left: Layout.getWidth(20),
                top: Layout.getHeight(widget.placeholderPadding ?? 10),
                bottom: Layout.getHeight(widget.placeholderPadding ?? 10),
              ),

              // if input has label text
              floatingLabelBehavior: widget.floatingLabelBehavior,
              labelText: widget.labelText,
              labelStyle: Styles.normalText.copyWith(
                fontSize: Layout.getHeight(15),
                color: widget.labelTextColor ?? Colors.black,
              ),

              // remove text counter below the input when maxLength is defined
              counterText: '',

              // borders
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? Styles.lightGrey,
                ),
                borderRadius: BorderRadius.circular(
                  Layout.getWidth(
                    widget.borderRadious ?? 6,
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? Styles.lightGrey,
                ),
                borderRadius: BorderRadius.circular(
                  Layout.getWidth(
                    widget.borderRadious ?? 6,
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? Styles.greyColor,
                ),
                borderRadius: BorderRadius.circular(
                  Layout.getWidth(
                    widget.borderRadious ?? 6,
                  ),
                ),
              ),

              // placeholder
              hintText: widget.placeholder,
              hintStyle: Styles.normalText.copyWith(
                color: widget.hintColor ?? Styles.textGrey,
                fontSize: Layout.getHeight(widget.hintSize ?? 12),
                fontWeight: FontWeight.w500,
              ),

              // left icon
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: widget.prefixColor ?? Styles.greyColor,
                      size: Layout.getHeight(widget.prefixSize ?? 20),
                    )
                  : null,

              // right icon
              suffixIcon: widget.suffixIcon != null
                  ? Transform.rotate(
                      angle: widget.suffixTransform ?? 0,
                      child: Icon(
                        widget.suffixIcon,
                        color: widget.suffixColor ?? Styles.greyColor,
                        size: Layout.getHeight(widget.suffixSize ?? 20),
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

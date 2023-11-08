import 'package:flutter/material.dart';
import '../utils/style.dart';

@immutable
class CustomTextField extends StatefulWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool autofocus;
  final bool showError;
  final TextStyle textStyle;
  final Color fillColor;
  final Color fillErrorColor;
  final Function onTyping;
  final double leftPadding;
  final Color cursorColor;
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle labelStyle;
  final double textFieldHeight;
  final Widget prefixIcon;
  final contentPadding;
  final double prefixPadding;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Alignment prefixAlignment;
  final int minLines;

  final int? maxLines;

  CustomTextField({
    required this.focusNode,
    required this.controller,
    this.labelText = '',
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
    this.showError = false,
    this.textStyle = AppTextStyle.textFieldText,
    this.fillColor = AppColor.textFieldFill,
    Key? key,
    required this.onTyping,
    this.fillErrorColor = AppColor.fillErrorColor,
    this.leftPadding = 0.0,
    this.cursorColor = AppColor.primary,
    this.textFieldHeight = AppValues.textFieldHeight,
    this.prefixIcon = const SizedBox(),
    this.hintText = '',
    this.hintStyle = const TextStyle(),
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.prefixPadding = 13,
    this.prefixAlignment = Alignment.centerLeft,
    this.focusedBorderColor = Colors.transparent,
    this.enabledBorderColor = Colors.transparent,
    this.minLines = 1,
    this.maxLines,
    this.labelStyle = AppTextStyle.textFieldLabel,
  }) : super(key: key);

  CustomTextField.password(
      {required this.focusNode,
      required this.controller,
      required this.labelText,
      required this.keyboardType,
      this.autofocus = false,
      this.showError = true,
      this.textStyle = AppTextStyle.textFieldText,
      this.fillColor = AppColor.textFieldFill,
      Key? key,
      required this.onTyping,
      required this.fillErrorColor,
      required this.leftPadding,
      this.cursorColor = AppColor.primary,
      this.textFieldHeight = AppValues.textFieldHeight,
      this.prefixIcon = const SizedBox(),
      this.hintText = '',
      this.hintStyle = const TextStyle(),
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      this.prefixPadding = 13,
      this.prefixAlignment = Alignment.centerLeft,
      this.focusedBorderColor = Colors.transparent,
      this.enabledBorderColor = Colors.transparent,
      this.minLines = 1,
      this.maxLines,
      this.labelStyle = AppTextStyle.textFieldLabel})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  void _focusNodeListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget?.focusNode?.addListener(_focusNodeListener);
  }

  @override
  void dispose() {
    widget?.focusNode?.removeListener(_focusNodeListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty)
          Text(widget.labelText, style: AppTextStyle.textFieldLabel),
        if (widget.labelText.isNotEmpty) const SizedBox(height: 9),
        Stack(
          alignment: widget.prefixAlignment,
          children: [
            SizedBox(
              height: widget.textFieldHeight,
              child: TextField(
                maxLines: widget.maxLines,
                expands:widget.maxLines==null? true:false,
                onChanged: (x) {
                  print('provider.houseNumber ${widget.controller.text}');

                  if (widget.onTyping != null) widget.onTyping(x);
                },
                focusNode: widget.focusNode,
                controller: widget.controller,
                minLines: null,
                style: widget.textStyle,
                keyboardType: widget.keyboardType,
                autofocus: widget.autofocus,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle,
                  fillColor: widget.showError
                      ? widget.fillErrorColor
                      : widget.fillColor,
                  filled: true,
                  contentPadding: widget.contentPadding,
                  counterText: '',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.focusedBorderColor, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(4.0))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.enabledBorderColor, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(4.0))),
                ),
              ),
            ),
            _prefixIcon()
          ],
        ),
      ],
    );
  }

  Widget _prefixIcon() {
    return Padding(
      padding: EdgeInsets.only(left: widget.prefixPadding),
      child: Container(
        //height: widget.textFieldHeight,
        child: widget.prefixIcon,
      ),
    );
  }
}

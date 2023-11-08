import 'package:flutter/material.dart';

import '../utils/style.dart';


@immutable
class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isDisabled;
  final bool isOutlineStyle;
  final Color enabledColor;
  final Widget leading;
  final double height;

  final TextStyle textStyle;
  final disabledColor;

  final double cornerRadius;

   CustomButton({
     required this.text,
      required this.onTap,
    this.isDisabled = false,
    this.enabledColor = AppColor.primary,
    this.disabledColor = AppColor.disabledButton,
    this.cornerRadius = 4,
    this.leading=const SizedBox(),
    this.textStyle = AppTextStyle.buttonTextStyleEnabled, this.height = 55,
  }) : isOutlineStyle = false;

  const CustomButton.outline({
     required this.text,
     required this.onTap,
    this.isDisabled = false,
    this.enabledColor = AppColor.primary,
    this.disabledColor = AppColor.disabledButton,
    this.cornerRadius = 4,
    this.leading=const SizedBox(),
    this.textStyle = AppTextStyle.buttonTextStyleEnabled, this.height =50,
  }) : isOutlineStyle = true;

  BoxDecoration _decoration() {
    if (isOutlineStyle) {
      return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        border: Border.all(color: enabledColor, width: 2),
      );
    } else if (isDisabled) {
      return BoxDecoration(
        color: disabledColor,

        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
      );
    } else {
      return BoxDecoration(
        color: enabledColor,
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Container(
          height: height,
          alignment: Alignment.center,
          decoration: _decoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leading == null
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: leading,
                    ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$text',
                    textAlign: TextAlign.center,
                    style: isOutlineStyle
                        ? AppTextStyle.buttonTextStyleDisabled.copyWith(color: enabledColor)
                        : textStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

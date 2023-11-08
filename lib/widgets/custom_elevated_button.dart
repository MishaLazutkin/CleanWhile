import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/style.dart';

class CustomElevatedButton extends StatelessWidget {
  final BuildContext context;
  final String uriPic;
  final String title;
  final Function onTap;
  final Color bgColor;
  final TextStyle textStyle;
  final double height;
  final Alignment alignment;

  const CustomElevatedButton({Key? key,
    required this.context,
    required this.uriPic,
    required this.title,
    required this.onTap, this.bgColor = const Color.fromRGBO(
        255, 255, 255, 1), this.textStyle = const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        fontFamily: AppFont.heavy,
        color: Color.fromRGBO(0, 0, 0, 1)),   this.height=60,this.alignment=  Alignment.centerLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: Color.fromRGBO(229, 229, 229, 1)),

            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(AppValues.regularCornerRadius)),
            elevation: 0.0,
            backgroundColor: bgColor,
            alignment: alignment,
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8)
        ),

        onPressed: () => onTap(),
        icon: SvgPicture.asset(uriPic),
        label: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(title,
              style:textStyle),
        ), //label text
      ),
    );
  }
}

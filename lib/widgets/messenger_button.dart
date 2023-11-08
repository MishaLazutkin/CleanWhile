import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/style.dart';

class MessengerButton extends StatefulWidget {
  final String title;
  final String uriPic;

  const MessengerButton({Key? key, required this.title, required this.uriPic})
      : super(key: key);

  @override
  State<MessengerButton> createState() => _MessengerButtonState();
}

class _MessengerButtonState extends State<MessengerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(247, 247, 247, 1),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SvgPicture.asset(widget.uriPic),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text('${widget.title}',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    fontFamily: AppFont.heavy,
                    color: Color.fromRGBO(0, 0, 0, 1))),
          )
        ],
      ),
    );
  }
}

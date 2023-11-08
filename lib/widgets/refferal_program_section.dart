import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/style.dart';
import 'all.dart';

class RefferalProgramSection extends StatelessWidget {
  final TextEditingController referral;
  final FocusNode refferalNode;
  final Function onTyping;
  final Function onCollapseExpand;
  final Function onApply;
  final double turnsRefferal;
  final bool isExpandedRefferal;

  const RefferalProgramSection(
      {Key? key,
      required this.referral,
      required this.refferalNode,
      required this.onTyping,
      required this.onApply,
      required this.onCollapseExpand,
      required this.turnsRefferal,   this.isExpandedRefferal=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCollapseExpand();
      },
      child: Column(
        children: [
          DottedBorder(
            dashPattern: const [6, 6],
            color: const Color.fromRGBO(240, 240, 240, 1),
            child: Container(
              width: double.infinity,
              height: 46,
              child: Row(
                children: [
                  const SizedBox(
                    width: 13,
                  ),
                  const Text(
                    'Реферальна програма',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(
                    width: 13.3,
                  ),
                  AnimatedRotation(
                      turns: turnsRefferal,
                      duration: const Duration(milliseconds: 300),
                      child: SvgPicture.asset(
                        'lib/assets/icons/vector.svg',
                        width: 10,
                        height: 6,
                      ))
                ],
              ),
            ),
          ),
          Visibility(
            visible: isExpandedRefferal ,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: CustomTextField(
                    focusNode: refferalNode,
                    controller: referral,
                    textFieldHeight: 56,
                    hintText: 'Refferal code',
                    onTyping: (x) => onTyping(x),
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(155, 158, 170, 1)),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 56,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColor.primary,
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.heavy,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        onApply();
                      },
                      child: const Text('Застосувати'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

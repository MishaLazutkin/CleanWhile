import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/style.dart';
import 'all.dart';

class PromocodeSection extends StatelessWidget {
  final TextEditingController promocode;
  final FocusNode promocodeNode;
  final Function onTyping;
  final Function onApply;

  const PromocodeSection(
      {Key? key,
      required this.promocode,
      required this.promocodeNode,
      required this.onTyping,
      required this.onApply})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: CustomTextField(
              prefixIcon: SvgPicture.asset(
                'lib/assets/icons/promocode.svg',
                width: 34,
                height: 34,
              ),
              focusNode: promocodeNode,
              controller: promocode,
              textFieldHeight: 56,
              contentPadding:
                  const EdgeInsets.only(left: 60, top: 8, bottom: 8, right: 16),
              hintText: 'Введіть промокод',
              onTyping: (x) {
                onTyping(x);
              },
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
                onPressed: () {},
                child: const Text('Застосувати'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

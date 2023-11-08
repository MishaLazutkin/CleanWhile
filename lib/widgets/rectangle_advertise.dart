import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/style.dart';

class RectangleAdvertize extends StatelessWidget {
  final String asset;
  final Color backgroundColor;

  const RectangleAdvertize(
      {Key? key, required this.asset, required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(asset),
            const SizedBox(
              width: 20,
            ),
            const Expanded(
              child: Text(
                'Наші співробітники мають необхідні засоби та інвентарі для прибирання. Пилосос замовити можливо додатково',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFont.heavy,
                    color: Color.fromRGBO(43, 43, 43, 1)),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}

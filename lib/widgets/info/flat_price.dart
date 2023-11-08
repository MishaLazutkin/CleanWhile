import 'package:clean_whale/utils/style.dart';
import 'package:clean_whale/widgets/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../cell_small.dart';

class FlatPrice extends StatefulWidget {
  final String title;
  final String subTitle;
  final String price;
  final String description;
  final bool showClock;
  final Color backgroundColor;
  final Color borderColor;
  final double elevation;

  const FlatPrice({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.description,
    this.backgroundColor = const Color.fromRGBO(247, 247, 247, 1),
    this.showClock = true,
    this.borderColor = const Color.fromRGBO(235, 235, 235, 1),
    this.elevation=0.0
  }) : super(key: key);

  @override
  State<FlatPrice> createState() => _FlatPriceState();
}

class _FlatPriceState extends State<FlatPrice> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: widget.elevation,
      shadowColor: const Color.fromRGBO(120, 120, 120, 0.4),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 29, horizontal: 16),
        decoration: BoxDecoration(
          color: widget.backgroundColor,

          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: widget.borderColor, width: 4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${widget.title}',
                    style: const TextStyle(
                        fontSize: 22,
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFont.heavy),
                  ),
                ),
              ],
            ),
            if (widget.showClock)
              const SizedBox(
                height: 22,
              ),
            if (widget.showClock)
              Row(
                children: [
                  SvgPicture.asset('lib/assets/icons/time 1.svg'),
                  const SizedBox(
                    width: 21,
                  ),
                  Expanded(
                    child: Text(
                      '${widget.subTitle}',
                      style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFont.heavy),
                    ),
                  ),
                ],
              ),
            const SizedBox(
              height: 27,
            ),
            Row(
              children: [
                Text(
                  '${widget.price}',
                  style: const TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFont.heavy),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${widget.description}',
                    style: AppTextStyle.secondaryTitleInfoPages,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            CustomButton(text: 'Замовити', onTap: () {})
          ],
        ),
      ),
    );
  }
}

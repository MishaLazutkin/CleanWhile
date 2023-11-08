import 'package:clean_whale/utils/style.dart';
import 'package:flutter/material.dart';

import '../cell_small.dart';


class DiscountInfo extends StatelessWidget {
  final Widget percent;
  final String title;
  final Color textColor;
  final Color backgroundColor;

  const DiscountInfo({Key? key,
    required this.percent,
    required this.title,
    required this.textColor,
    this.backgroundColor = const Color.fromRGBO(255, 255, 255, 1)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

          color: backgroundColor,
          borderRadius: BorderRadius.circular(4)),
      padding:const EdgeInsets.all(  13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
         if(percent is CellSmall) Expanded(flex: 1, child: Center(child: percent)),

          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '$title',
                style: TextStyle(
                    fontSize: 13,
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFont.heavy),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

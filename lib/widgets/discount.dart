import 'package:clean_whale/utils/style.dart';
import 'package:flutter/material.dart';

import 'cell_small.dart';

class Discount extends StatefulWidget {
  final Widget percent;
  final String title;
  final String price;
  final Color textColor;
  final Color backgroundColor;

  const Discount({Key? key,
    required this.percent,
    required this.title,
    required this.price,
    required this.textColor,
    this.backgroundColor = const Color.fromRGBO(255, 255, 255, 1)})
      : super(key: key);

  @override
  State<Discount> createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(4)),
      padding:const EdgeInsets.symmetric(horizontal:  13,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 40, child: Center(child: widget.percent)),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 10,
            child: Column(
              children: [
                Center(
                  child: Text(
                    '${widget.title}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        color: widget.textColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFont.heavy),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                '${widget.price}',
                style: TextStyle(
                    fontSize: 17,
                    color: widget.textColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFont.heavy),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

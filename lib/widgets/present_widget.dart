import 'package:clean_whale/providers/present_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/style.dart';

class PresentWidget extends StatelessWidget {
  final Widget image;
  final String title;
  final String price;
  final Color textColor;
  final Color backgroundColor;

  const PresentWidget(
      {Key? key,
      required this.image,
      required this.title,
      required this.price,
      required this.textColor,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PresentProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height : 40,child: image ),

                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '$price',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFont.heavy),
                      ),
                    ],
                  )),

              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '$title',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                color: textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.heavy),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),

              // const SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        );
      },
    );
  }
}

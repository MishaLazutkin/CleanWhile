import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/style.dart';

class WindowWidget extends StatelessWidget {
  final String title;
  final String picUri;

  const WindowWidget({Key? key, required this.title, required this.picUri})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 26,),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: AppFont.heavy,
                            fontSize: 14,
                            color: Color.fromRGBO(43, 43, 43, 1),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Center(
                      child: Image.asset(
                    '$picUri',
height: 95,
                  )))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(800 ~/ 10, (index) =>
          Expanded(
            child: Container(
              color: index % 2 == 0 ?  const Color.fromRGBO(192, 192, 192, 1)
                  : Colors.transparent,
              height: 1,
            ),
          )),
    );
  }
}

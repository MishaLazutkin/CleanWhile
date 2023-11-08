import 'package:flutter/material.dart';

import '../utils/style.dart';

class CellSmall extends StatelessWidget {
  String title;
  CellSmall(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColor.cell,
      ),
      child: Center(child: Text(title,style: AppTextStyle.cellText,)),
    );
  }
}

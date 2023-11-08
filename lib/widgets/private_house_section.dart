import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/style.dart';
import 'all.dart';

class PrivateHouseSection extends StatelessWidget {
  final Function onCheckHouse;
  final bool isCheckedHouse;

  const PrivateHouseSection(
      {Key? key, required this.onCheckHouse, required this.isCheckedHouse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCheckbox(
          isChecked: isCheckedHouse,
          onChanged: (value) {
            onCheckHouse(value);
          },
        ),
        const SizedBox(
          width: 15,
        ),
        SvgPicture.asset('lib/assets/icons/private-house-order.svg'),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child:
            Text('Приватний будинок', style: AppTextStyle.checkBoxTitle)),
        Expanded(child: Align(
            alignment: Alignment.centerRight, child: CellSmall('x 1.2')))

      ],
    );
  }
}

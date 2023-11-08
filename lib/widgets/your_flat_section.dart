import 'package:flutter/material.dart';

import '../utils/style.dart';
import 'all.dart';

class YourFlatSection extends StatelessWidget {
  final String title;
  final int roomCount;
  final int sanitaryUnitCount;
  final Function onIncRoom;
  final Function onDecRoom;
  final Function onIncSanitaryUnit;
  final Function onDecSanitaryUnit;
  final Function onCheckKitchen;
  final Function onCheckAnex;
  final bool isCheckedKitchen;
  final bool isCheckedAnex;
  final bool showLabel;

  const YourFlatSection({Key? key,
    required this.title,
    required this.onIncRoom,
    required this.onDecRoom,
    required this.onIncSanitaryUnit,
    required this.onDecSanitaryUnit,
    required this.onCheckKitchen,
    required this.onCheckAnex,
    this.roomCount = 0,
    this.sanitaryUnitCount = 0, required this.isCheckedKitchen, required this.isCheckedAnex,   this.showLabel=false })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitlePrimary(title: title),
        const SizedBox(
          height: 50,
        ),
        CounterPrimaryWidget(
          '${roomCount} Кімната',
          onIncrementTap: () => onIncRoom(),
          onDecrementTap: () => onDecRoom(),
        ),
        const SizedBox(
          height: 10,
        ),
        CounterPrimaryWidget(
          '${sanitaryUnitCount} Санвузол',
          onIncrementTap: () => onIncSanitaryUnit(),
          onDecrementTap: () => onDecSanitaryUnit(),
        ),

        const SizedBox(
          height: 5,
        ),
          Visibility(
            visible: showLabel,
            child: const Text(
            '* Повноцінне прибирання всієї квартири, кухні, туалету та ванної кімнати',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13,
                fontFamily: AppFont.heavy,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(191, 191, 191, 1)),
        ),
          ),
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCheckbox(
              isChecked:isCheckedKitchen,
              onChanged: (value) {
                onCheckKitchen(value);
              },
            ),
            const SizedBox(
              width: 15,
            ),
            Text('Кухня', style: AppTextStyle.checkBoxTitle),
            const SizedBox(
              width: 32,
            ),
            const Text('або',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    fontFamily: AppFont.heavy,
                    color: Color.fromRGBO(191, 191, 191, 1))),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCheckbox(
              isChecked:isCheckedAnex,
              onChanged: (value) {
                onCheckAnex(value);
              },
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child:
                Text('Анекс кухонний', style: AppTextStyle.checkBoxTitle)),
            const Spacer(),
            CellSmall('-10 zl')
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const DottedLine(),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

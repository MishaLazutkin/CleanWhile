import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/style.dart';
import 'all.dart';

class VacuumCleanerSection extends StatelessWidget {
  final bool isChecked;
  final Function onCheckVacuum;

  const VacuumCleanerSection(
      {Key? key, required this.onCheckVacuum, this.isChecked = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCheckbox(
              isChecked: isChecked,
              onChanged: (value) {
                onCheckVacuum(value);
              },
            ),
            const SizedBox(
              width: 37,
            ),
            SvgPicture.asset(
              'lib/assets/icons/vacuum-hand.svg',
              width: 36,
              height: 52,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Додати ручний пилосос до замовлнення',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: AppFont.heavy,
              color: Color.fromRGBO(
                43,
                43,
                43,
                1,
              )),
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          'На замовленні немає свого пилососа',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: AppFont.heavy,
              color: Color.fromRGBO(
                43,
                43,
                43,
                0.94,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        CellSmall('25.00 zł')
      ],
    );
  }
}

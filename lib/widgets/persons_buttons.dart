import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cars_provider.dart';
import '../utils/style.dart';

class PersonButtons extends StatelessWidget {
  final List<bool> selectionsHuman;
  final Color fillColor;
  final List<bool> isSelected;
  final Function onPressed;

  const PersonButtons({
    Key? key,
    required this.selectionsHuman,
    this.fillColor = AppColor.primary,
    this.isSelected = const [true, false],
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ToggleButtons(
          fillColor: fillColor,
          selectedColor: Colors.white,
          isSelected: selectionsHuman,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          children: [
            Container(
                width: (MediaQuery.of(context).size.width - 32) / 2,
                child: const Center(child: Text('Фіз. особа'))),
            Container(
                width: (MediaQuery.of(context).size.width - 32) / 2 - 3,
                child: const Center(child: Text('Юр. особа')))
          ],
          onPressed: (int index) => onPressed(index)

          ),
    );
  }
}

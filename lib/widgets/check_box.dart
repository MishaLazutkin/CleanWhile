import 'package:flutter/material.dart';

import '../utils/style.dart';

class CustomCheckbox extends StatefulWidget {
  final bool isChecked;
  final Function onChanged;
  final bool showContractError;

  CustomCheckbox(
      {this.isChecked = false,
      required this.onChanged,
      super.key,
      this.showContractError = false});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        color:  widget.showContractError ?AppColor.fillErrorColor: AppColor.secondary,
        border: Border.all(width: 1, color: AppColor.checkBoxBorder),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Checkbox(
        checkColor: Colors.black,
        activeColor: AppColor.secondary,
        fillColor: widget.showContractError ? MaterialStateProperty.all<Color>(AppColor.fillErrorColor):
        MaterialStateProperty.all<Color>(AppColor.secondary),
        value: widget.isChecked,
        onChanged: (bool? value) {
          print('onChanged value $value');

          widget.onChanged(value);

        },
      ),
    );
  }
}

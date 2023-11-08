import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/style.dart';

class SelectPhone extends StatelessWidget {
  const SelectPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: AppValues.textFieldHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: const Color.fromRGBO(237, 237, 237, 1),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset('lib/assets/icons/flag-ukraine.svg'),
          const SizedBox(
            width: 7,
          ),
          const Text('+380'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../utils/style.dart';

class DividerTitle extends StatelessWidget {
  final String title;

  const DividerTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            height: 1,
            color: Colors.grey,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: AppTextStyle.titleDividerRegular,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            height: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

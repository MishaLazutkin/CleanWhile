import 'package:flutter/material.dart';

import '../utils/style.dart';

class TitlePrimary extends StatelessWidget {
  final String title;

  const TitlePrimary({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 47.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text('$title'.toUpperCase(),
                  style: AppTextStyle.titlePrimary,
                  textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }
}

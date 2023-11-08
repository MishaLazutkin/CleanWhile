import 'package:flutter/material.dart';

import '../utils/style.dart';

class PersonalDataTitle extends StatelessWidget {
  const PersonalDataTitle({Key? key,   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: RichText(
        text:   TextSpan(
          style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: AppFont.heavy,
              fontWeight: FontWeight.w400),
          children: const [
            TextSpan(
              text:
              'Я не даю згоди на використання моїх персональних даних з метою надсилання підписки та маркетингових пропозицій. ',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: AppFont.heavy,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),

          ],
        ),
      ),
    );
  }
}

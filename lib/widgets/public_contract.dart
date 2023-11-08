import 'package:flutter/material.dart';

import '../utils/style.dart';

class PublicContractTitle extends StatelessWidget {
  final bool showContractError;

  const PublicContractTitle({Key? key,   this.showContractError=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: RichText(
        text:   TextSpan(
          style: TextStyle(
              fontSize: 15,
              fontFamily: AppFont.heavy,

              fontWeight: FontWeight.w400),
          children:  [
            TextSpan(
              text:
              'Оформлюючи замовлення, я тим самим висловлюю згоду з ',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: AppFont.heavy,
                  fontWeight: FontWeight.w400,
                color:  showContractError  ?AppColor.errorTextColor:Colors.black,),
            ),
            TextSpan(
              text:
              'договором публічної оферти та політикою Конфіденційності. ',
              style: TextStyle(
                fontSize: 15,
                fontFamily: AppFont.heavy,
                fontWeight: FontWeight.w400,
                color:  showContractError  ?AppColor.errorTextColor:Colors.black,
                decoration: TextDecoration.underline,
              ), //<-- SEE HERE
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../public_contract.dart';
import '../services/navigation_service/navigation_service.dart';
import 'style.dart';
import '../widgets/rectangle_advertise.dart';

class AppHelper {
  static Widget headerAdvertise() {
    return RectangleAdvertize(
        asset: 'lib/assets/icons/noun-like.svg',
        backgroundColor: AppColor.orangeRectangleColor);
  }

  static Widget footerAdvertize() {
    return const RectangleAdvertize(
        asset: 'lib/assets/icons/detergents.svg',
        backgroundColor: Color.fromRGBO(255, 234, 132, 1));
  }

  static Widget publicContract(
      {required BuildContext context,
      required Function onSelect,
      bool isSelected = false}) {
    return Row(
      children: [
        SvgPicture.asset(
          'lib/assets/icons/vector2.svg',
          color: isSelected
              ? const Color.fromRGBO(255, 255, 255, 1)
              : const Color.fromRGBO(189, 71, 64, 1),
        ),
        const SizedBox(
          width: 18,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              //onTap: () =>onSelect(),
              children: [
                TextSpan(
                  text: 'Погоджуюся з ',
                  recognizer: TapGestureRecognizer()..onTap = onSelect(),
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? const Color.fromRGBO(255, 255, 255, 1)
                          : const Color.fromRGBO(189, 71, 64, 1)),
                ),
                TextSpan(
                  text: 'публічним договором',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      NavigationService().push(context,const PublicContract());

                    },
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? const Color.fromRGBO(255, 255, 255, 1)
                          : const Color.fromRGBO(189, 71, 64, 1),
                      decoration: TextDecoration.underline), //<-- SEE HERE
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  static Widget loginSocialButton(
      {required BuildContext context,
      required String uriPic,
        required String title,
      required Function onTap}) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Color.fromRGBO(229, 229, 229, 1)),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppValues.regularCornerRadius)),
            elevation: 0.0,
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1)),

        onPressed: () => onTap(),
        icon: Image.asset(uriPic),
        label:   Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: AppFont.heavy,
                  color: Color.fromRGBO(119, 119, 119, 1))),
        ), //label text
      ),
    );
  }
}

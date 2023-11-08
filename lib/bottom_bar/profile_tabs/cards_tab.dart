import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/profile_provider.dart';
import '../../utils/style.dart';
import '../../widgets/accept_dialog.dart';
import '../../widgets/all.dart';
import '../../widgets/custom_elevated_button.dart';

class CardsTab extends StatefulWidget {
  const CardsTab({Key? key}) : super(key: key);

  @override
  State<CardsTab> createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),

          _addFirstCard(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
 Widget _addFirstCard(){
   return Padding(
     padding: const EdgeInsets.only(top: 50.0),
     child: CustomButton(
         cornerRadius: 10,
         height: 68,
         textStyle: const TextStyle(
             color: Color.fromRGBO(43, 43, 43, 1),
             fontFamily: AppFont.heavy,
             fontWeight: FontWeight.w500,
             fontSize: 18),
         enabledColor: const Color.fromRGBO(89, 183, 139, 1),
         leading: SvgPicture.asset('lib/assets/icons/plus.svg'),
         text: 'Нова карта',
       onTap: () {
         showDialog(
             context: context,
             builder: (BuildContext context) {
               return AcceptAlertDialog(
                 title: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     InkWell(
                         onTap: () {
                           Navigator.of(context).pop();
                         },
                         child: const Icon(Icons.close))
                   ],
                 ),
                 text:
                 'Для підтвердження карти буде списана невелика сума. Після підтвердження вона повернеться на рахунок',
                 onAccept: () {},
                 textButton: 'Продовжити',
               );
             });
       },),
   );
 }
}

import 'package:clean_whale/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CounterPrimaryWidget extends StatefulWidget {
  late String title;
  final Function onIncrementTap;
  final Function onDecrementTap;

  CounterPrimaryWidget(this.title,
      {super.key, required this.onIncrementTap, required this.onDecrementTap});

  @override
  State<CounterPrimaryWidget> createState() => _CounterPrimaryWidgetState();
}

class _CounterPrimaryWidgetState extends State<CounterPrimaryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColor.secondary,
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            InkWell(
            onTap: ()=> widget.onIncrementTap() ,
    child: SizedBox(width: 25,height: 25,child: Center(child: SvgPicture.asset('lib/assets/icons/plus.svg')))),
    Text(
    '${widget.title} ',
    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
    ),
    InkWell(
    onTap: ()=> widget.onDecrementTap() ,
    child: SizedBox(height: 25,width:25,child: Center(child: SvgPicture.asset('lib/assets/icons/minus.svg',)))),
    ]
    ,
    )
    ,
    );
  }

}

import 'package:clean_whale/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CounterSecondaryWidget extends StatefulWidget {
  late int count;
  final Function onIncrementTap;
  final Function onDecrementTap;

  CounterSecondaryWidget(  this.count,
      {super.key, required this.onIncrementTap, required this.onDecrementTap});

  @override
  State<CounterSecondaryWidget> createState() => _CounterSecondaryWidgetState();
}

class _CounterSecondaryWidgetState extends State<CounterSecondaryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 2)),
        height: 50,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: InkWell(
                  onTap: () => widget.onDecrementTap(),
                  child: SizedBox(
                      width: 25,
                      height: 25,
                      child: Center(
                        child: SvgPicture.asset('lib/assets/icons/minus.svg',
                            color: Colors.white),
                      ))),
            ),
            Flexible(
              child: Center(
                child: Text(
                  '${widget.count} ',
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700,color: Colors.white),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () => widget.onIncrementTap(),
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: Center(
                    child: SvgPicture.asset('lib/assets/icons/plus.svg',

                        color: Colors.white),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

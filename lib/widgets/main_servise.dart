import 'package:clean_whale/widgets/cell_small.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../providers/default_order_provider.dart';
import '../utils/style.dart';

class MainService extends StatelessWidget {
  final Widget image;
  final String title;
  final Color textColor;
  final Color backgroundColor;

  const MainService(
      {Key? key,
      required this.title,
      required this.textColor,
      required this.image,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DefaultOrderProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius:
                  BorderRadius.circular(AppValues.regularCornerRadius)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 15,
              ),
              Expanded(flex: 1, child: Center(child: image)),
              const Spacer(
                  //height: 13,
                  ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$title',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: textColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.heavy),
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:clean_whale/widgets/cell_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/default_order_provider.dart';
import '../utils/style.dart';

class ServiceWidget extends StatelessWidget {
  final Widget image;
  final String title;
  final Color textColor;
  final Color backgroundColor;

  const ServiceWidget(
      {Key? key,
      required this.title,
        this.textColor=const Color.fromRGBO(64, 64, 64, 1),
      required this.image,
      this.backgroundColor = AppColor.backgroundGridViewItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DefaultOrderProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius:
                  BorderRadius.circular(AppValues.regularCornerRadius)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(height : 40,child: image ),
             // Expanded(flex: 1, child: Center(child: image)),

              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '$title',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                color: textColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.heavy),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),

              // const SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        );
      },
    );
  }
}

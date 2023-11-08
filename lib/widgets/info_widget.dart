import 'package:clean_whale/widgets/cell_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/default_order_provider.dart';
import '../utils/style.dart';

class InfoWidget extends StatelessWidget {
  final Widget image;
  final String title;
  final String subTitle;

  const InfoWidget({Key? key, required this.title,  required this.image, required this.subTitle,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Consumer<DefaultOrderProvider>(
      builder: (context, provider, child) {
        return   Container(
            padding:const EdgeInsets.all(  16),
          decoration: BoxDecoration(
            color: AppColor.backgroundGridViewItem ,
              borderRadius: BorderRadius.circular(AppValues.regularCornerRadius)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 10,
              ),
              //SizedBox(height : 50,child: image ),
              Center(child: image),

              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '$title',
                            textAlign:TextAlign.center,
                          style:     TextStyle(
                              fontSize: 15,
                              color:Color.fromRGBO(43, 43, 43, 1) ,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFont.heavy),
                        ),
                      ),
                    ],
                  ),

                ],
              ),

              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '$subTitle',
                            textAlign:TextAlign.center,
                          style:     TextStyle(
                              fontSize: 13,
                              color:Color.fromRGBO(0, 0, 0, 1) ,
                              fontWeight: FontWeight.w300,
                              fontFamily: AppFont.heavy),
                        ),
                      ),
                    ],
                  ),

                ],
              ),


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

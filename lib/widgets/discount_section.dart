import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/style.dart';
import 'cell_small.dart';
import 'custom_gridview.dart';
import 'discount.dart';

class DiscountSection extends StatelessWidget {
  final int selectedDiscountId;
  final List<Map<String, dynamic>> discountDataList;
  final Function onTap;

  const DiscountSection(
      {Key? key,
      this.selectedDiscountId = -1,
      required this.discountDataList,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color.fromRGBO(242, 242, 242, 1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Column(
                children: const [
                  Text(
                    'Що частіше прибираєте,',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color.fromRGBO(43, 43, 43, 1),
                        fontFamily: AppFont.heavy),
                  ),
                  Text(
                    'то вище знижка',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color.fromRGBO(36, 87, 198, 1),
                        fontFamily: AppFont.heavy),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Вартість вашого наступного прибирання, якщо оформити передплату',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color.fromRGBO(43, 43, 43, 0.57),
                        fontFamily: AppFont.heavy),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomGridView(
              padding: const EdgeInsets.only(top: 0 ),

              listWidget: List.generate(
                  discountDataList.length,
                      (index) => Discount(
                    percent: discountDataList[index].containsKey('percent')
                        ? CellSmall(discountDataList[index]['percent'])
                        : Container(
                        height: 30,
                        child: SvgPicture.asset(
                          'lib/assets/icons/😔.svg',
                        )),
                    title: discountDataList[index]['title'],
                    price: discountDataList[index]['price'],
                    textColor:
                    selectedDiscountId == discountDataList[index]['id'] ? Colors.white : Colors.black,
                    backgroundColor: selectedDiscountId == discountDataList[index]['id']
                        ? AppColor.primary
                        : const Color.fromRGBO(255, 255, 255, 1),
                  )),
              onTap: (id)  => onTap(id)
            ),
          ],
        ),
      ),
    );
  }
}

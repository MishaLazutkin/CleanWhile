import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/style.dart';

class CustomDropDown extends StatelessWidget {
  final List<Map<String, dynamic>> listCities;
  final Function onValuesSelected;
  final Map<String, dynamic> selectedValue;

  const CustomDropDown(
      {Key? key,
      required this.listCities,
      required this.onValuesSelected,
      required this.selectedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          //  underline: Divider(),
          // hint: Text(
          //   'Select Item',
          //   style: TextStyle(
          //     fontSize: 14,
          //     color: Theme
          //         .of(context)
          //         .hintColor,
          //   ),
          // ),
          items:
              // ListView.separated(itemBuilder: (context, index) {},
              //     separatorBuilder: Divider(),
              //     itemCount: listCities.length)

              listCities.map((option) {
            return DropdownMenuItem(
              value: option,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(option['title'],
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppFont.heavy)),
                      const SizedBox(
                        width: 10,
                      ),
                      _cell(option['bonus'])
                    ],
                  ),

                  // Divider( ),
                ],
              ),
            );
          }).toList(),
          icon: SvgPicture.asset(
            'lib/assets/icons/vector.svg',
            height: 6,
            color: const Color.fromRGBO(191, 191, 191, 1),
          ),
          value: selectedValue,
          onChanged: (value) => onValuesSelected(value),
          buttonHeight: 40,
          buttonWidth: 100,
          itemHeight: 40,
          itemWidth: 200,
          offset: const Offset(-50, 0),
          dropdownBorderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          selectedItemBuilder: (ctx) {
            return listCities.map((m) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(m['title']),
                    ],
                  ),
                  // const SizedBox(width: 100,)
                ],
              );
            }).toList();
          },
        ),
      ),
    );
  }

  Widget _cell(String price) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.cell,
      ),
      child: Center(
          child: Text(
        price,
        style: AppTextStyle.cellText,
      )),
    );
  }
}

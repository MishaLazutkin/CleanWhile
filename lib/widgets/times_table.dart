import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:clean_whale/utils/style.dart';

class TimeTable extends StatelessWidget {
  final List<Map<String, dynamic>> listTimes;
  final Function onPressedTimeButton;
  final String selectedTime;

  const TimeTable(
      {Key? key,
      required this.listTimes,
      required this.onPressedTimeButton,
      required this.selectedTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 5,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 3 / 2,
      children: List.generate(listTimes.length, (index) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                color: _getBackgroundColor(index),
                borderRadius: BorderRadius.circular(4)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                alignment: AlignmentDirectional.center,


                items: listTimes[index]['subTimes']
                    .map<DropdownMenuItem<String>>((option) {
                  return DropdownMenuItem(
                    value: option.toString(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(option,
                                  style: TextStyle(
                                      fontSize: 13,
                                      overflow: TextOverflow.fade,
                                      //color: _getForegroundColor(index),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: AppFont.heavy)),
                            ),
                          ],
                        ),

                        // Divider( ),
                      ],
                    ),
                  );
                }).toList(),
                icon: SizedBox(
                  width: 0,
                  height: 0,
                ),
                value: listTimes[index]['time'],
                isExpanded: true,
                onChanged: (value) {
                  onPressedTimeButton(index, value);
                },
                buttonHeight: 40,
                buttonWidth: 75,
                isDense: true,
                buttonPadding: EdgeInsets.all(8),
                itemHeight: 40,
                itemWidth: 65,
                //offset: const Offset(-50, 0),
                dropdownBorderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                selectedItemBuilder: (ctx) {


                  return listTimes[index]['subTimes'].map<Widget>((time) {
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(time,style:   TextStyle(
                              fontSize: 13,
                              overflow: TextOverflow.fade,
                              color: _getForegroundColor(index),
                              fontWeight: FontWeight.w500,
                              fontFamily: AppFont.heavy),),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
              ),
            ),
          ),

        );
      }),
    );
  }

  Color _getBackgroundColor(int index) {
    int resultIndex =
    listTimes.indexWhere((element) => element['time'] == selectedTime);
    if (resultIndex == index)
      return AppColor.primary;
    else
      return Color.fromRGBO(242, 242, 242, 1);
  }

  Color _getForegroundColor(int index) {
    int resultIndex =
        listTimes.indexWhere((element) => element['time'] == selectedTime);
    if (resultIndex == index)
      return Colors.white;
    else
      return Colors.black;
  }
}

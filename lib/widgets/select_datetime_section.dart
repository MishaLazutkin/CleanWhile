import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import '../utils/style.dart';
import 'all.dart';

class DateTimeSection extends StatefulWidget {
  final List<bool> selectedClarifications;
  final List<Map<String, dynamic>> listTimes;
  final Function onPressedClarButton;
  final Function onPressedTimeButton;
  final Function onSelectDate;
  final String selectedTime;
  final GroupButtonController controller;
  final GlobalKey timeKey;
  final bool showDateError;

  final bool showTimeError;

  const DateTimeSection({
    Key? key,
    required this.selectedClarifications,
    required this.listTimes,
    required this.onPressedClarButton,
    required this.onPressedTimeButton,
    required this.selectedTime,
    required this.controller,
    required this.onSelectDate,
    required this.timeKey,
    this.showDateError = false,
    this.showTimeError = false,
  }) : super(key: key);

  @override
  State<DateTimeSection> createState() => _DateTimeSectionState();
}

class _DateTimeSectionState extends State<DateTimeSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSecondary(title: 'Оберiть зручну дату  i час прибирання'),
        const SizedBox(
          height: 68,
        ),
        CalendarCustom(
          onSelectDate: (date) {
            widget.onSelectDate(date);
          },
          borderColor: widget.showDateError
              ? AppColor.errorBorderColor
              : AppColor.calendarCustomBorder,
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppValues.regularCornerRadius),
              border: Border.all(
                color: widget.showTimeError
                    ? AppColor.errorBorderColor
                    : AppColor.timeTableBorder,
                width: 2,
              )),
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              TimeTable(
                  key: widget.timeKey,
                  listTimes: widget.listTimes,
                  onPressedTimeButton: widget.onPressedTimeButton,
                  selectedTime: widget.selectedTime),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Flexible(
                    child: GroupButton(
                      controller: widget.controller,
                      buttons: [
                        'Можно почати в будь-який час',
                        'Уточнити за день до прибирання'
                      ],
                      options: GroupButtonOptions(
                          buttonWidth: MediaQuery.of(context).size.width,
                          buttonHeight: 50,
                          elevation: 0.0,
                          spacing: 5,
                          textAlign: TextAlign.center,
                          selectedTextStyle:
                              const TextStyle(color: Colors.white),
                          unselectedTextStyle:
                              const TextStyle(color: Colors.black),
                          unselectedShadow: const [],
                          unselectedColor:
                              const Color.fromRGBO(242, 242, 242, 1),
                          selectedColor: AppColor.primary,
                          direction: Axis.vertical,
                          groupingType: GroupingType.column),
                      onSelected: (s, index, selected) =>
                          widget.onPressedClarButton(index),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

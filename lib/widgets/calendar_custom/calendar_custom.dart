import 'dart:math';
import 'package:clean_whale/utils/style.dart';
import 'package:clean_whale/widgets/calendar_custom/profitable_offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/core.dart';

class CalendarCustom extends StatefulWidget {
  final Function onSelectDate;
  final Color borderColor;

  const CalendarCustom(
      {Key? key,
      required this.onSelectDate,
      this.borderColor = AppColor.backgroundGridViewItem})
      : super(key: key);

  @override
  State<CalendarCustom> createState() => _CalendarCustomState();
}

class _CalendarCustomState extends State<CalendarCustom> {
  final DateTime _minDate = DateTime.now();
  List<ProfitableOffer> _profitableOfferDataCollection = <ProfitableOffer>[];
  final List<int> _airlineId = <int>[1, 2, 3, 4];
  final List<String> _profitableOffers = <String>[];

  @override
  void initState() {
    _profitableOfferDetails();
    _profitableOfferData();
    super.initState();
  }

  void _profitableOfferData() {
    _profitableOfferDataCollection = <ProfitableOffer>[];
    for (int i = 0; i < 5; i++) {
      int id = i % _airlineId.length;
      if (id == 0) {
        id = 1;
      } else if (id > _airlineId.length) {
        id -= 1;
      }
      final String fare = _profitableOffers[i % _profitableOffers.length];
      const Color color = Colors.grey;
      _profitableOfferDataCollection.add(ProfitableOffer(fare, color));
    }
  }

  void _profitableOfferDetails() {
    _profitableOffers.add(r'-13%');
    _profitableOffers.add(r'-6%');
  }

  int i = 0;

  Widget _monthCellBuilder(
      BuildContext buildContext, MonthCellDetails details) {
    // print('visibleDates ${details.visibleDates.length}');
    Random random = Random();
    final bool isToday = isSameDate(details.date, DateTime.now());
    final bool isTomorrow =
        isSameDate(details.date, DateTime.now().add(const Duration(days: 1)));
    final bool dayAfterTomorrow =
        isSameDate(details.date, DateTime.now().add(const Duration(days: 2)));
    final ProfitableOffer bestPrice =
        _profitableOfferDataCollection[random.nextInt(1)];
    final bool isDisabledDate =
        details.date.isBefore(_minDate) && !isSameDate(details.date, _minDate);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: const Color.fromRGBO(250, 250, 250, 1),
          ),
          borderRadius: BorderRadius.circular(4),
          color: isTomorrow || dayAfterTomorrow
              ? const Color.fromRGBO(227, 240, 231, 1)
              : isDisabledDate
                  ? null
                  : const Color.fromRGBO(244, 244, 244, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (isToday) ...[
            const Text(
              'Сьогоднi',
              style: TextStyle(
                  fontSize: 8,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            )
          ],
          if (isTomorrow || dayAfterTomorrow)
            Text(
              bestPrice.percent,
              style: const TextStyle(
                  fontSize: 10,
                  color: Color.fromRGBO(39, 148, 97, 1),
                  fontWeight: FontWeight.w700),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    details.date.day.toString(),
                    style: TextStyle(
                        fontSize: 12,
                        color: isDisabledDate
                            ? const Color.fromRGBO(191, 191, 191, 1)
                            : Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppValues.regularCornerRadius),
              border: Border.all(color: widget.borderColor, width: 2)),
          child: SfCalendar(
              showNavigationArrow: true,
              onTap: (CalendarTapDetails details) {
                final DateTime? date = details.date;
                print('tapped date ${date.toString()}  ');
                widget.onSelectDate(date);
              },
              firstDayOfWeek: 1,
              view: CalendarView.month,
              monthCellBuilder: _monthCellBuilder,
              showDatePickerButton: false,
              minDate: _minDate,
              monthViewSettings:
                  const MonthViewSettings(numberOfWeeksInView: 6),
              backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
              headerStyle: const CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              viewNavigationMode: ViewNavigationMode.none,
              headerHeight: 80,
              headerDateFormat: 'MMMM'),
        ),
        Stack(alignment: AlignmentDirectional.center, children: [
          SvgPicture.asset('lib/assets/icons/month_label.svg'),
          const Padding(
            padding: EdgeInsets.only(top: 7.0),
            child: Text(
              'Це вже травень',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          )
        ])
      ],
    );
  }
}

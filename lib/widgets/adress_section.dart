import 'package:clean_whale/widgets/all.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../utils/style.dart';
import 'custom_dropdown.dart';

class AdressSection extends StatelessWidget {
  final TextEditingController street;

  final TextEditingController postalCode;
  final TextEditingController houseNumber;
  final TextEditingController flatNumber;
  final TextEditingController frame;
  final TextEditingController entranceNumber;
  final TextEditingController floorNumber;
  final TextEditingController intercomCode;
  final FocusNode streetNode;
  final FocusNode postalCodeNode;
  final FocusNode houseNumberCodeNode;
  final FocusNode flatNumberNode;
  final FocusNode frameNode;
  final FocusNode entranceNumberNode;
  final FocusNode floorNumberNode;
  final FocusNode itercomCodeNode;

  final String title;
  final List<Map<String, dynamic>> listCities;
  final Map<String, dynamic> selectedValue;
  final Function onValuesSelected;
  final Function onStreetTyping;
  final Function onPostalCodeTyping;
  final Function onNumbHouseTyping;
  final Function onNumbFlatTyping;
  final Function onFrameTyping;
  final Function onEntranceTyping;
  final Function onNumbFloorTyping;
  final Function onCodeIntercomeTyping;
  final bool showErrorStreet;
  final bool showErrorHouseNumber;

  AdressSection(
      {Key? key,
      required this.title,
      required this.listCities,
      required this.onValuesSelected,
      required this.selectedValue,
      required this.onStreetTyping,
      required this.onPostalCodeTyping,
      required this.onNumbHouseTyping,
      required this.onNumbFlatTyping,
      required this.onFrameTyping,
      required this.onEntranceTyping,
      required this.onNumbFloorTyping,
      required this.onCodeIntercomeTyping,
      this.showErrorStreet = false,
      this.showErrorHouseNumber = false,
      required this.street,
      required this.postalCode,
      required this.houseNumber,
      required this.flatNumber,
      required this.frame,
      required this.entranceNumber,
      required this.floorNumber,
      required this.intercomCode,
      required this.streetNode,
      required this.postalCodeNode,
      required this.houseNumberCodeNode,
      required this.flatNumberNode,
      required this.frameNode,
      required this.entranceNumberNode,
      required this.floorNumberNode,
      required this.itercomCodeNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleSecondary(title: title),
        const SizedBox(
          height: 22,
        ),
        _selectCity(),
        const SizedBox(
          height: 30,
        ),
        _adressForm(),
      ],
    );
  }

  Widget _selectCity() {
    return DottedBorder(
      dashPattern: const [6, 6],
      color: const Color.fromRGBO(240, 240, 240, 1),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Column(
          children: [
            const Text(
              'Оберіть своє місто:',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFont.heavy),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomDropDown(
                  listCities: listCities,
                  onValuesSelected: onValuesSelected,
                  selectedValue: selectedValue,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _adressForm() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode: streetNode,
                  controller: street,
                  labelText: 'Вулиця',
                  showError: showErrorStreet,
                  onTyping: (x) => onStreetTyping(x)),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode: postalCodeNode,
                  controller: postalCode,
                  labelText: 'Поштовий код',
                  onTyping: (x) => onPostalCodeTyping(x)),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode: houseNumberCodeNode,
                  controller: houseNumber,
                  showError: showErrorHouseNumber,
                  labelText: 'Номер будинку',
                  onTyping: (x) => onNumbHouseTyping(x)),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: CustomTextField(
                  focusNode: flatNumberNode,
                  controller: flatNumber,
                  labelText: 'Номер квартири',
                  onTyping: (x) => onNumbFlatTyping(x)),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode: frameNode,
                  controller: frame,
                  labelText: 'Корпус',
                  onTyping: (x) => onFrameTyping(x)),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: CustomTextField(
                  focusNode: entranceNumberNode,
                  controller: entranceNumber,
                  labelText: 'Номер під\'їзду',
                  onTyping: (x) => onEntranceTyping(x)),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode: floorNumberNode,
                  controller: floorNumber,
                  labelText: 'Поверх',
                  onTyping: (x) => onNumbFloorTyping(x)),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: CustomTextField(
                  focusNode: itercomCodeNode,
                  controller: intercomCode,
                  labelText: 'Код від домофона',
                  onTyping: (x) => onCodeIntercomeTyping(x)),
            ),
          ],
        ),
      ],
    );
  }
}

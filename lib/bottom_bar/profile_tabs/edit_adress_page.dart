import 'package:clean_whale/widgets/adress_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/profile_provider.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_button.dart';

class EditAdress extends StatefulWidget {
  const EditAdress({Key? key}) : super(key: key);

  @override
  State<EditAdress> createState() => _EditAdressState();
}

class _EditAdressState extends State<EditAdress> {
  final TextEditingController _street = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();
  final TextEditingController _houseNumber = TextEditingController();
  final TextEditingController _flatNumber = TextEditingController();
  final TextEditingController _frame = TextEditingController();
  final TextEditingController _entranceNumber = TextEditingController();
  final TextEditingController _floorNumber = TextEditingController();
  final TextEditingController _intercomCode = TextEditingController();
  final FocusNode _streetNode = FocusNode();
  final FocusNode _postalCodeNode = FocusNode();
  final FocusNode _houseNumberCodeNode = FocusNode();
  final FocusNode _flatNumberNode = FocusNode();
  final FocusNode _frameNode = FocusNode();
  final FocusNode _entranceNumberNode = FocusNode();
  final FocusNode _floorNumberNode = FocusNode();
  final FocusNode _itercomCodeNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  _formData(),
                  const SizedBox(
                    height: 55,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      text: 'Зберегти',
                      onTap: () {

                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:   CustomBottomBar( 4),
    );
  }

  Widget _formData() {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return AdressSection(
          street: _street,
          postalCode: _postalCode,
          houseNumber: _houseNumber,
          flatNumber: _flatNumber,
          frame: _frame,
          entranceNumber: _entranceNumber,
          floorNumber: _floorNumber,
          intercomCode: _intercomCode,
          streetNode: _streetNode,
          postalCodeNode: _postalCodeNode,
          houseNumberCodeNode: _houseNumberCodeNode,
          flatNumberNode: _flatNumberNode,
          frameNode: _frameNode,
          entranceNumberNode: _entranceNumberNode,
          floorNumberNode: _floorNumberNode,
          itercomCodeNode: _itercomCodeNode,
          title: 'редагувати адресу',
          listCities: provider.listCities,
          selectedValue: provider.selectedCity,
          onValuesSelected: (city) {
            provider.selectedCity = city;
          },
          onStreetTyping: (x) {
            provider.editedStreet = x;
          },
          onPostalCodeTyping: (x) {
            provider.editedPostalCode = x;
          },
          onNumbHouseTyping: (x) {
            provider.editedHouseNumber = x;
          },
          onNumbFlatTyping: (x) {
            provider.editedFlatNumber = x;
          },
          onFrameTyping: (x) {
            provider.editedFrame = x;
          },
          onEntranceTyping: (x) {
            provider.editedEntranceNumber = x;
          },
          onNumbFloorTyping: (x) {
            provider.editedFloorNumber = x;
          },
          onCodeIntercomeTyping: (x) {
            provider.editedIntercomCode = x;
          },
        );
      },
    );
  }
}

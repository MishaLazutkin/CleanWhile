import 'package:clean_whale/widgets/present_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../utils/style.dart';

class PresentProvider extends ChangeNotifier {

  late int _selectedCertificateId = -1;
  late double _cashPresent;
  late String _emailCertificate;
  late String _phoneCertificate;
  late String _descriptionCertificate;
  late String _yourEmail;
  late String _yourPhone;
  late bool _isCheckedContract = false;

  late List<Map<String, dynamic>> _presentDataList;


  Future<void> init() async {
    _presentDataList = [
      {
        'id': 1,
        'title': 'прибирання однокімнатної квартири або хімчистка дивана',
        'price': '150 zł',
        'uriPicture': 'lib/assets/icons/present.png',
      },
      {
        'id': 2,
        'title': 'прибирання двокімнатної квартири',
        'price': '200 zł',
        'uriPicture': 'lib/assets/icons/present.png',
      },
      {
        'id': 3,
        'title':
            'прибирання трикімнатної квартири або хімчистка дивана та килимів',
        'price': '300 zł',
        'uriPicture': 'lib/assets/icons/present.png',
      },
      {
        'id': 4,
        'title': 'прибирання чотирикімнатної квартири',
        'price': '400 zł',
        'uriPicture': 'lib/assets/icons/present.png',
      },
    ];



    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
  }

  bool get isInited {
    return true;
  }

  Future<void> loadPresents(int task_id) async {
    notifyListeners();
  }

  List<Widget> presentOptionsList() {
    return List.generate(
        _presentDataList.length,
        (index) => PresentWidget(
              title: _presentDataList[index]['title'],
              price: _presentDataList[index]['price'],
              textColor: const Color.fromRGBO(0, 0, 0, 1),
              backgroundColor: _presentDataList[index]['id'] == _selectedCertificateId
                  ? AppColor.presentSelected
                  : const Color.fromRGBO(255, 234, 132, 1),
              image: Image.asset(_presentDataList[index]['uriPicture']),
            ));
  }

  bool validate() {
    return false;
  }

  Future<void> reset() async {}
  //
  // bool isValidated(){
  //  bool emailIsValid = EmailValidator.validate( email);
  // }
  //
  // bool _isValidated() {
  //   final email = _emailTextController.text;
  //   bool emailIsValid = false;
  //   emailIsValid = EmailValidator.validate( email);
  //   if (email.trim().isEmpty) {
  //     emailIsValid = false;
  //     _emailError = 'Field is required';
  //   }else
  //   if(!emailIsValid) _emailError = 'Please enter valid email';
  //   setState(() {});
  //   return emailIsValid;
  // }

  List<Map<String, dynamic>> get presentDataList => _presentDataList;

  bool get isCheckedContract => _isCheckedContract;

  set isCheckedContract(bool value) {
    _isCheckedContract = value;
    notifyListeners();
  }

  String get yourPhone => _yourPhone;

  set yourPhone(String value) {
    _yourPhone = value;
  }

  String get yourEmail => _yourEmail;

  set yourEmail(String value) {
    _yourEmail = value;
  }

  String get descriptionCertificate => _descriptionCertificate;

  set descriptionCertificate(String value) {
    _descriptionCertificate = value;
  }

  String get phoneCertificate => _phoneCertificate;

  set phoneCertificate(String value) {
    _phoneCertificate = value;
  }

  String get emailCertificate => _emailCertificate;

  set emailCertificate(String value) {
    _emailCertificate = value;
  }

  double get cashPresent => _cashPresent;

  set cashPresent(double value) {
    _cashPresent = value;

    notifyListeners();
  }

  int get selectedCertificateId => _selectedCertificateId;

  set selectedCertificateId(int value) {
    _selectedCertificateId = value;
    notifyListeners();
  }
}

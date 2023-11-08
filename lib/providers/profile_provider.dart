import 'package:flutter/material.dart';
import 'dart:async';

class ProfileProvider extends ChangeNotifier {
  late String _street;

  late String _postalCode;

  late String _houseNumber;

  late String _flatNumber;

  late String _frame;

  late String _entranceNumber;

  late String _floorNumber;

  late String _intercomCode;

 late String _editedStreet;

  late String _editedPostalCode;

  late String _editedHouseNumber;

  late String _editedFlatNumber;

  late String _editedFrame;

  late String _editedEntranceNumber;

  late String _editedFloorNumber;

  late String _editedIntercomCode;


  late List<Map<String, dynamic>> _listNews;
  late List<Map<String, dynamic>> _listCities;
  late List<Map<String, dynamic>> _myOrders;
  late List<Map<String, dynamic>> _listAdresses;
  late Map<String,dynamic> _selectedCity;

  Future<void> init() async {
    _listNews = [
      {
        'title': '-20 % до кінця грудня',
        'text': 'Lorem ipsum dolor sit amet consectetur. Aliquet malesuada fermentum pellentesque mi sit vitae tortor mattis tempus.',
        'uriPicture': 'lib/assets/icons/news1.svg',
      },
       {
        'title': '-10 % до кінця ciчня',
        'text': 'Lorem ipsum dolor sit amet consectetur. Aliquet malesuada fermentum pellentesque mi sit vitae tortor mattis tempus.',
        'uriPicture': 'lib/assets/icons/payments.svg',
      },
    ];

    _listCities = [
      {
        'title': 'Warszawa',
        'bonus': '+20 zl',
      },
      {
        'title': 'Kyiv',
        'bonus': '+20 zl',
      },
      {
        'title': 'Lviv',
        'bonus': '+20 zl',
      },
      ];
     _myOrders = [
      {
        'id': 1,
        'hesh': '#3476',
        'date': '01.01.2023',
        'time': '18:00',
        'title': 'Lorem ipsum dolor sit amet consectetur. Ac eget fermentum tincidunt morbi. Tristique vel sit lorem sed consectetur in in est. Facilisis ultrices sed nulla parturient erat condimentum lorem aenean iaculis.',
        'pay': 'Карта online/Apple Pay/Google Pay',
        'adress': 'Warszawa, вул. ul.Opaczewska, номер будинку: 23, квартира: 2, 16-130',
        'performedBy': 'Олена Тополя',
        'price': '210 zl',
      },
      {
        'id': 2,
        'hesh': '#3476',
        'date': '01.01.2023',
        'time': '18:00',
        'title': 'Lorem ipsum dolor sit amet consectetur. Ac eget fermentum tincidunt morbi. Tristique vel sit lorem sed consectetur in in est. Facilisis ultrices sed nulla parturient erat condimentum lorem aenean iaculis.',
        'pay': 'Карта online/Apple Pay/Google Pay',
        'adress': 'Warszawa, вул. ul.Opaczewska, номер будинку: 23, квартира: 2, 16-130',
        'performedBy': 'Олена Тополя',
        'price': '210 zl',
      },
      {
        'id': 3,
        'hesh': '#3476',
        'date': '01.01.2023',
        'time': '18:00',
        'title': 'Lorem ipsum dolor sit amet consectetur. Ac eget fermentum tincidunt morbi. Tristique vel sit lorem sed consectetur in in est. Facilisis ultrices sed nulla parturient erat condimentum lorem aenean iaculis.',
        'pay': 'Карта online/Apple Pay/Google Pay',
        'adress': 'Warszawa, вул. ul.Opaczewska, номер будинку: 23, квартира: 2, 16-130',
        'performedBy': 'Олена Тополя',
        'price': '210 zl',
      },
       {
        'id': 4,
         'hesh': '#3476',
         'date': '01.01.2023',
         'time': '18:00',
         'title': 'Lorem ipsum dolor sit amet consectetur. Ac eget fermentum tincidunt morbi. Tristique vel sit lorem sed consectetur in in est. Facilisis ultrices sed nulla parturient erat condimentum lorem aenean iaculis.',
         'pay': 'Карта online/Apple Pay/Google Pay',
         'adress': 'Warszawa, вул. ul.Opaczewska, номер будинку: 23, квартира: 2, 16-130',
         'performedBy': 'Олена Тополя',
         'price': '210 zl',
      },
 {
        'id': 5,
         'hesh': '#3476',
         'date': '01.01.2023',
         'time': '18:00',
         'title': 'Lorem ipsum dolor sit amet consectetur. Ac eget fermentum tincidunt morbi. Tristique vel sit lorem sed consectetur in in est. Facilisis ultrices sed nulla parturient erat condimentum lorem aenean iaculis.',
         'pay': 'Карта online/Apple Pay/Google Pay',
         'adress': 'Warszawa, вул. ul.Opaczewska, номер будинку: 23, квартира: 2, 16-130',
         'performedBy': 'Олена Тополя',
         'price': '210 zl',
      },
{
        'id': 6,
         'hesh': '#3476',
         'date': '01.01.2023',
         'time': '18:00',
         'title': 'Lorem ipsum dolor sit amet consectetur. Ac eget fermentum tincidunt morbi. Tristique vel sit lorem sed consectetur in in est. Facilisis ultrices sed nulla parturient erat condimentum lorem aenean iaculis.',
         'pay': 'Карта online/Apple Pay/Google Pay',
         'adress': 'Warszawa, вул. ul.Opaczewska, номер будинку: 23, квартира: 2, 16-130',
         'performedBy': 'Олена Тополя',
         'price': '210 zl',
      },

      ];
   // _myOrders = [];

     _listAdresses = [
      {
        'title': 'Warszawa, вул. 23 NİSAN MAH 254. SOKAK A BLOK NO:2 İÇ KAPI NO 14 NİLÜFER, номер будинку: 23, квартира: 2, 16-130',
        'isRemovable': false,
        'isDefault': true,

      },
      {
        'title': 'Warszawa, вул. ul.Opaczewska, номер будинку: 23, квартира: 2, 16-130',
        'isRemovable': true,
        'isDefault': false,
      },

        {
        'title': 'Warszawa, вул. 23 NİSAN MAH 254. SOKAK A BLOK NO:2 İÇ KAPI NO 14 NİLÜFER, номер будинку: 23, квартира: 2, 16-130',
          'isDefault': true,
          'isRemovable': false,
      },
      {
        'title': 'Warszawa, вул. ul.Opaczewska, номер будинку: 23, квартира: 2, 16-130',
        'isRemovable': false,
        'isDefault': false,
      },

        {
        'title': 'Warszawa, вул. 23 NİSAN MAH 254. SOKAK A BLOK NO:2 İÇ KAPI NO 14 NİLÜFER, номер будинку: 23, квартира: 2, 16-130',
        'isRemovable': false,
          'isDefault': true,
      },
      {
        'title': 'Warszawa, вул. ul.Opaczewska, номер будинку: 23, квартира: 2, 16-130',
        'isRemovable': false,
        'isDefault': false,
      },


      ];


    _selectedCity = _listCities[0];

    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
  }

  bool get isInited {
    return true;
  }

  Future<void> load(int task_id) async {
    notifyListeners();
  }

  bool validate() {
    return false;
  }

  Future<void> reset() async {}

  List<Map<String, dynamic>> get listNews => _listNews;

  List<Map<String, dynamic>> get listCities => _listCities;

  Map<String, dynamic> get selectedCity => _selectedCity;

  set selectedCity(Map<String, dynamic> value) {
    _selectedCity = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> get listAdresses => _listAdresses;

  List<Map<String, dynamic>> get myOrders => _myOrders;

  String get editedIntercomCode => _editedIntercomCode;

  set editedIntercomCode(String value) {
    _editedIntercomCode = value;
  }

  String get editedFloorNumber => _editedFloorNumber;

  set editedFloorNumber(String value) {
    _editedFloorNumber = value;
  }

  String get editedEntranceNumber => _editedEntranceNumber;

  set editedEntranceNumber(String value) {
    _editedEntranceNumber = value;
  }

  String get editedFrame => _editedFrame;

  set editedFrame(String value) {
    _editedFrame = value;
  }

  String get editedFlatNumber => _editedFlatNumber;

  set editedFlatNumber(String value) {
    _editedFlatNumber = value;
  }

  String get editedHouseNumber => _editedHouseNumber;

  set editedHouseNumber(String value) {
    _editedHouseNumber = value;
  }

  String get editedPostalCode => _editedPostalCode;

  set editedPostalCode(String value) {
    _editedPostalCode = value;
  }

  String get editedStreet => _editedStreet;

  set editedStreet(String value) {
    _editedStreet = value;
  }

  String get intercomCode => _intercomCode;

  set intercomCode(String value) {
    _intercomCode = value;
  }

  String get floorNumber => _floorNumber;

  set floorNumber(String value) {
    _floorNumber = value;
  }

  String get entranceNumber => _entranceNumber;

  set entranceNumber(String value) {
    _entranceNumber = value;
  }

  String get frame => _frame;

  set frame(String value) {
    _frame = value;
  }

  String get flatNumber => _flatNumber;

  set flatNumber(String value) {
    _flatNumber = value;
  }

  String get houseNumber => _houseNumber;

  set houseNumber(String value) {
    _houseNumber = value;
  }

  String get postalCode => _postalCode;

  set postalCode(String value) {
    _postalCode = value;
  }

  String get street => _street;

  set street(String value) {
    _street = value;
  }
}

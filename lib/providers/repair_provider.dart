import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/svg.dart';
import 'package:group_button/group_button.dart';
import '../utils/style.dart';
import '../widgets/all.dart';

class RepairProvider extends ChangeNotifier {
  late String _street = '';

  late String _postalCode = '';

  late String _houseNumber = '';

  late String _flatNumber = '';

  late String _frame = '';

  late String _entranceNumber = '';

  late String _floorNumber = '';

  late String _intercomCode = '';

  late String _name = '';

  late String _phoneNumber = '';

  late String _email = '';

  late String _additionalInfo = '';

  late String _promocode = '';

  late String _refferal = '';

  late String _invoiceFirstName = '';
  late String _invoiceNip = '';
  late String _invoiceAddress = '';
  late String _invoicePostalCode = '';
  late String _selectedTime = '';
  late String _adressKeysBefore = '';
  late String _adressKeysAfter = '';
  late int _square  =0;
  late int _windowsCount  =0;



  late bool _isSelectedPublicContract=false;
  late bool _isSelectedUsePersonalData=false;
  late double _turns = 0;
  late double _turnsRefferal = 0;
  late bool _isExpandedRefferal = false;
  late List<Map<String, dynamic>> _listCities;
  late Map<String,dynamic> _selectedCity;

  late DateTime _selectedDate ;

  final GroupButtonController  _groupButtonController =GroupButtonController();
  late List<bool> _selectionsCarType = [true, false];
  late List<bool> _selectionsHuman = [true, false];
  late List<bool> _selectionsCarsWash = [true, false];

  late List<bool> _selectionsPayMethod = [false, false];

  late List<bool> _selectedTakeKeys=[false,false] ;
  late bool _isCheckedDelivery = false;


  late List<Map<String, dynamic>> _listTimes;
  late List<bool> _selectedClarifications = [false,false];
  late List<Map<String, dynamic>> _carsWashDataList;
  late List<Function> _carsWashIncFunc;
  late List<Function> _carsWashDecFunc;


  late List<int> _carsWashOptionsCount;

  late bool isCheckedCarsWash = false;
  late bool isCheckedCarsClean = false;


  Future<void> init() async {

    _listTimes = [
      {
        'time': '7:30',
        'subTimes':['7:30','7:45'],
      },
      {
        'time': '8:00',
        'subTimes':['8:00','8:15','8:30','8:45'],
      },
      {
        'time': '9:00',
        'subTimes':['9:00','9:15','9:30','9:45'],
      },
      {
        'time': '10:00',
        'subTimes':['10:00','10:15','10:30','10:45'],
      },
      {
        'time': '11:00',
        'subTimes':['11:00','11:15','11:30','11:45'],
      },
      {
        'time': '12:00',
        'subTimes':['12:00','12:15','12:30','12:45'],
      },
      {
        'time': '13:00',
        'subTimes':['13:00','13:15','13:30','13:45'],
      },
      {
        'time': '14:00',
        'subTimes':['14:00','14:15','14:30','14:45'],
      },
      {
        'time': '15:00',
        'subTimes':['15:00','15:15','15:30','15:45'],
      },
      {
        'time': '16:00',
        'subTimes':['16:00','16:15','16:30','16:45'],
      },
      {
        'time': '17:00',
        'subTimes':['17:00','17:15','17:30','17:45'],
      },
      {
        'time': '18:00',
        'subTimes':['18:00','18:15','18:30','18:45'],
      },
      {
        'time': '19:00',
        'subTimes':['19:00','19:15','19:30','19:45'],
      },
      {
        'time': '20:00',
        'subTimes':['20:00','20:15','20:30','20:45'],
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
    _selectedCity = _listCities[0];

    _carsWashDataList = [
      {
        'title': 'Чистка шкіряної оббивки',
        'price': '100 zł',
        'uriPicture': 'lib/assets/icons/car-leather 1.svg',
        'isSingle': true,
      },
      {
        'title': 'Повна чистка оббивки',
        'price': '100 zł',
        'uriPicture': 'lib/assets/icons/car-seat 1.svg',
        'isSingle': true,
      },
      {
        'title': 'Озонування',
        'price': '100 zł',
        'uriPicture': 'lib/assets/icons/car-ozone 1.svg',
        'isSingle': true,
      },
      {
        'title': 'Прання однієї речі',
        'price': '100 zł',
        'uriPicture': 'lib/assets/icons/car-interior 1.svg',
        'isSingle': false,
      },
      {
        'title': 'Невидимий склоочисник',
        'price': '100 zł',
        'uriPicture': 'lib/assets/icons/base (1) 1.svg',
        'isSingle': false,
      },
      {
        'title': 'Видалення волосся',
        'price': '100 zł',
        'uriPicture': 'lib/assets/icons/base (1) 1.svg',
        'isSingle': true,
      },
      {
        'title': 'Прання килимків',
        'price': '100 zł',
        'uriPicture': 'lib/assets/icons/car-mats 1.svg',
        'isSingle': false,
      },
      {
        'title': 'VIP пральня (підлога + стеля + пластик + багажник + крісла + зовнішня мийка)',
        'price': '100 zł',
        'uriPicture': 'lib/assets/icons/car-full-service 1.svg',
        'isSingle': true,
      },
      {
        'title': 'Текст',
        'price': '100 zł',
        'uriPicture': 'lib/assets/icons/car-wash 1.svg',
        'isSingle': true,
      },
      {
        'title': 'VIP мийка (віск)',
        'price': '100 zł',
        'uriPicture': 'lib/assets/icons/car-service 1.svg',
        'isSingle': true,
      },
      {
        'title': 'VIP набір (воск)',
        'price': '100 zł',
        'uriPicture': 'lib/assets/icons/crown 1.svg',
        'isSingle': true,
      },
      {
        'title': 'Набір VIP+ (твердий віск преміум класу)',
        'price': '100 zł',
        'uriPicture': 'lib/assets/icons/base (1) 1.svg',
        'isSingle': true,
      },
    ];




    _selectionsCarType =
        List.generate(_carsWashDataList.length, (index) => false);




    _carsWashIncFunc = List.generate(_carsWashDataList.length, (index) {
      switch (index) {
        case 0:
          return () {};
        case 1:
          return () {};
        case 2:
          return () {};
        case 3:
          return () {
            _carsWashOptionsCount[index]++;
            notifyListeners();
          };
        case 4:
          return () {
            _carsWashOptionsCount[index]++;
            notifyListeners();
          };
        case 5:
          return () {};
        case 6:
          return () {
            _carsWashOptionsCount[index]++;
            notifyListeners();
          };
        case 7:
          return () {
            _carsWashOptionsCount[index]++;
            notifyListeners();
          };
        case 8:
          return () {
            _carsWashOptionsCount[index]++;
            notifyListeners();
          };
        case 9:
          return () {
            _carsWashOptionsCount[index]++;
            notifyListeners();
          };
        case 10:
          return () {
            _carsWashOptionsCount[index]++;
            notifyListeners();
          };
        case 11:
          return () {
            _carsWashOptionsCount[index]++;
            notifyListeners();
          };
        case 12:
          return () {
            _carsWashOptionsCount[index]++;
            notifyListeners();
          };
        default:
          return () {};
      }
    });


    _carsWashDecFunc = List.generate(_carsWashDataList.length, (index) {
      switch (index) {
        case 0:
          return () {};
        case 1:
          return () {};
        case 2:
          return () {};
        case 3:
          return () {
            if (_carsWashOptionsCount[index] > 1) {
              _carsWashOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 4:
          return () {
            if (_carsWashOptionsCount[index] > 1) {
              _carsWashOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 5:
          return () {};
        case 6:
          return () {
            if (_carsWashOptionsCount[index] > 1) {
              _carsWashOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 7:
          return () {
            if (_carsWashOptionsCount[index] > 1) {
              _carsWashOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 8:
          return () {
            if (_carsWashOptionsCount[index] > 1) {
              _carsWashOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 9:
          return () {
            if (_carsWashOptionsCount[index] > 1) {
              _carsWashOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 10:
          return () {
            if (_carsWashOptionsCount[index] > 1) {
              _carsWashOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 11:
          return () {
            if (_carsWashOptionsCount[index] > 1) {
              _carsWashOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 12:
          return () {
            if (_carsWashOptionsCount[index] > 1) {
              _carsWashOptionsCount[index]--;
            }
            notifyListeners();
          };
        default:
          return () {};
      }
    });

    _carsWashOptionsCount = List.generate(_carsWashDataList.length, (index) {
      switch (index) {
        case 0:
          return 0;
        case 1:
          return 0;
        case 2:
          return 0;
        case 3:
          return 1;
        case 4:
          return 1;
        case 5:
          return 0;
        case 6:
          return 1;
        case 7:
          return 1;
        case 8:
          return 1;
        case 9:
          return 1;
        case 10:
          return 1;
        case 11:
          return 1;
        case 12:
          return 1;
        default:
          return 0;
      }
    });


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

  Future<void> onApplyPromo( ) async {
    notifyListeners();
  }

  Future<void> onApplyReferal() async {
    notifyListeners();
  }

  List<Widget> carsOptionsList() {
    return List.generate(
        _carsWashDataList.length,
        (index) => ServiceWidgetExtend(
              title: _carsWashDataList[index]['title'],
              price: _carsWashDataList[index]['price'],
              textColor: _selectionsCarsWash[index] == true
                  ? Colors.white
                  : Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: _selectionsCarsWash[index] == true
                  ? AppColor.primary
                  : const Color.fromRGBO(248, 248, 248, 1),
              image: (_selectionsCarsWash[index] == true) &&
                      (!_carsWashDataList[index]['isSingle'])
                  ? CounterSecondaryWidget(
                      _carsWashOptionsCount[index],
                      onIncrementTap: _carsWashIncFunc[index],
                      onDecrementTap: _carsWashDecFunc[index],
                    )
                  : SvgPicture.asset(
                      _carsWashDataList[index]['uriPicture'],
                      // height: 30,
                    ),
            ));
  }





  bool validate() {
    return false;
  }

  Future<void> reset() async {}



  List<bool> get selectionsCarType => _selectionsCarType;

    setSelectionsCarType(List<bool> value) {
    _selectionsCarType = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> get cleanerOptionsDataList => _carsWashDataList;





  List<bool> get selectionsSelectPay => _selectionsPayMethod;

  selectionsPayMethod(int index, bool value) {
    _selectionsPayMethod[index] = value;
    if ((index == 0) && (value)) _selectionsPayMethod[1] = false;
    if ((index == 1) && (value)) _selectionsPayMethod[0] = false;
    notifyListeners();
  }


  List<bool> get selectionsHuman => _selectionsHuman;

  set selectionsHuman(List<bool> value) {
    _selectionsHuman = value;
    notifyListeners();
  }

  List<bool> get selectionsCarsWash => _selectionsCarsWash;

  set selectionsCarsWash(List<bool> value) {
    _selectionsCarsWash = value;
  }

  bool get isSelectedUsePersonalData => _isSelectedUsePersonalData;

  set isSelectedUsePersonalData(bool value) {
    _isSelectedUsePersonalData = value;
    notifyListeners();
  }

  bool get isSelectedPublicContract => _isSelectedPublicContract;

  set isSelectedPublicContract(bool value) {
    _isSelectedPublicContract = value;
    notifyListeners();
  }

  String get refferal => _refferal;

  set refferal(String value) {
    _refferal = value;
  }

  String get promocode => _promocode;

  set promocode(String value) {
    _promocode = value;
  }

  String get additionalInfo => _additionalInfo;

  set additionalInfo(String value) {
    _additionalInfo = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
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

  double get turnsRefferal => _turnsRefferal;

  set turnsRefferal(double value) {
    _turnsRefferal = value;
    notifyListeners();
  }

  bool get isExpandedRefferal => _isExpandedRefferal;

  set isExpandedRefferal(bool value) {
    _isExpandedRefferal = value;
    notifyListeners();
  }
  List<Map<String, dynamic>> get listCities => _listCities;
  Map<String, dynamic> get selectedCity => _selectedCity;

  set selectedCity(Map<String, dynamic> value) {
    _selectedCity = value;
    notifyListeners();
  }

  bool get isCheckedDelivery => _isCheckedDelivery;

  set isCheckedDelivery(bool value) {
    _isCheckedDelivery = value;
    notifyListeners();
  }

  List<bool> get selectedTakeKeys => _selectedTakeKeys;

  set selectedTakeKeys(List<bool> value) {
    _selectedTakeKeys = value;
    notifyListeners();
  }

  String get adressKeysAfter => _adressKeysAfter;

  set adressKeysAfter(String value) {
    _adressKeysAfter = value;
  }

  String get adressKeysBefore => _adressKeysBefore;

  set adressKeysBefore(String value) {
    _adressKeysBefore = value;
  }

  List<Map<String, dynamic>> get listTimes => _listTimes;


  List<bool> get selectedClarifications => _selectedClarifications;

  set selectedClarifications(List<bool> value) {
    _selectedClarifications = value;
    notifyListeners();
  }

  String get selectedTime => _selectedTime;

  set selectedTime(String value) {
    _selectedTime = value;
    notifyListeners();
  }
  GroupButtonController get groupButtonController => _groupButtonController;

  String get invoicePostalCode => _invoicePostalCode;

  set invoicePostalCode(String value) {
    _invoicePostalCode = value;
  }

  String get invoiceAddress => _invoiceAddress;

  set invoiceAddress(String value) {
    _invoiceAddress = value;
  }

  String get invoiceNip => _invoiceNip;

  set invoiceNip(String value) {
    _invoiceNip = value;
  }

  String get invoiceFirstName => _invoiceFirstName;

  set invoiceFirstName(String value) {
    _invoiceFirstName = value;
  }

  DateTime get selectedDate => _selectedDate;

  set selectedDate(DateTime value) {
    _selectedDate = value;
  }

  int get windowCount => _windowsCount;

  set windowCount(int value) {
    _windowsCount = value;
    notifyListeners();
  }

  int get square => _square;

  set square(int value) {
    _square = value;
    notifyListeners();
  }

}

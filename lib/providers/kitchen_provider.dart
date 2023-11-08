import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_svg/svg.dart';
import 'package:group_button/group_button.dart';

import '../utils/style.dart';
import '../widgets/cell_small.dart';
import '../widgets/counter_secondary.dart';
import '../widgets/discount.dart';
import '../widgets/service_widget.dart';
import '../widgets/service_widget_ext.dart';

class KitchenProvider extends ChangeNotifier {
  late String _street ;
  late String _postalCode  ;
  late String _houseNumber ;
  late String _flatNumber  ;
  late String _frame  ;
  late String _entranceNumber  ;
  late String _floorNumber  ;
  late String _intercomCode  ;
  late String _name  ;
  late String _phoneNumber  ;
  late String _email  ;
  late String _additionalInfo ;
  late String _promocode  ;
  late String _refferal ;
  late String _invoiceFirstName;
  late String _invoiceNip;
  late String _invoiceAddress;
  late String _invoicePostalCode;

  late bool _isSelectedPublicContract=false;
  late bool _isSelectedUsePersonalData=false;
  late List<Map<String, dynamic>> _listCities;
  late Map<String,dynamic> _selectedCity;



  late List<bool> _selectionsHuman = [true, false];

  late List<Map<String, dynamic>> _listTimes;
  late String _selectedTime='';
  late DateTime _selectedDate ;

  final GroupButtonController  _groupButtonController =GroupButtonController();

  late List<bool> _selectedClarifications = [false,false];
  late List<bool> _selectionsCleanOptions;
  late List<bool> _selectionsHandyManOptions;
  late List<bool> _selectionsDryCleaner;
  late List<bool> _selectionsPayMethod = [false, false];

  late int _selectedDiscountIndex = -1;
  late List<Map<String, dynamic>> _discountDataList;
  late List<bool> _selectedTakeKeys=[false,false] ;
  late bool _isCheckedDelivery = false;
  late String _adressKeysBefore;
  late String _adressKeysAfter;

  late List<Map<String, dynamic>> _handyManOptionsDataList;
  late List<Function> _cleanerOptionsIncFunc;
  late List<Function> _cleanerOptionsDecFunc;

  late List<Map<String, dynamic>> _dryCleanerDataList;
  late List<Map<String, dynamic>> _innerOuterOptionsDataList;
  late List<Map<String, dynamic>> _wipeCleanOptionsDataList;
  late List<Map<String, dynamic>> _alsoCleanOptionsDataList;
  late List<Map<String, dynamic>> _repairCleanerOptionsDataList;
  late List<Map<String, dynamic>> _windowCleanerOptionsDataList;
  late List<Function> _dryCleanerIncFunc;
  late List<Function> _dryCleanerDecFunc;

  late List<int> _cleanerOptionsCount;
  late List<int> _handyManOptionsCount;
  late List<int> _dryCleanerOptionsCount;

  late bool isChecked = false;
  late bool _isExpandedOptions = false;
  late bool _isExpandedCleanOptions = false;
  late bool _isExpandedRefferal = false;
  late double _turns = 0.0;
  late double _turnsRefferal = 0.0;


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

    _dryCleanerDataList = [
      {
        'title': 'Хімчистка двомісного дивана',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/sofa.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка тримісного дивана',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/corner-sofa.svg',
        'isSingle': false,
      },
      {
        'title': 'Прання кутового дивана (4 чол)',
        'price': '160 zł',
        'uriPicture': 'lib/assets/icons/sofa-corner.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка кутового дивана (5-6 чол)',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/corner-sofa-5-6.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка кутового дивана (7+  чол)',
        'price': '160 zł',
        'uriPicture': 'lib/assets/icons/corner-sofa-6-more.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка односпального матраца',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/single-mattress.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка односпального матраца з двох сторін',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/double-mattress.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка двоспального матраца ',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/single-mattress.svg',
        'isSingle': false,
      },
      {
        'title': 'Прасування',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/double-mattress.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка килима',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/carpet.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка килимового покриття',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/carpeting.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка крісла',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/armchair.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка стільців і табуретів',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/tabouret.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка офісних стільців',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/office-chair.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка м’якого узголів’я ліжка',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/bed.svg',
        'isSingle': false,
      },
      {
        'title': 'Чищення дитячого візка',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/baby-carriage.svg',
        'isSingle': false,
      },
    ];
    _innerOuterOptionsDataList = [
      {
        'title': 'Духовку та плиту',
        'uriPicture': 'lib/assets/icons/oven.svg',
      },
      {
        'title': 'Витяжку і ґратки',
        'uriPicture': 'lib/assets/icons/hood.svg',
      },
      {
        'title': 'Кухонні шафки',
        'uriPicture': 'lib/assets/icons/cabinets.svg',
      },

      {
        'title': 'Холодильник',
        'uriPicture': 'lib/assets/icons/fridge.svg',
      },
      {
        'title': 'Мікрохвильову піч',
        'uriPicture': 'lib/assets/icons/microoven.svg',
      },


      {
        'title': 'Посудомийна машина',
        'uriPicture': 'lib/assets/icons/dishwasher 1.svg',
      },

    ];
    _wipeCleanOptionsDataList = [
      {
        'title': 'Плитку',
        'uriPicture': 'lib/assets/icons/tile.svg',
      },
      {
        'title': 'Робочі поверхні',
        'uriPicture': 'lib/assets/icons/work-surface.svg',
      },
      {
        'title': 'Раковину',
        'uriPicture': 'lib/assets/icons/sink.svg',
      },

      {
        'title': 'Підлоги',
        'uriPicture': 'lib/assets/icons/floors.svg',
      },
      {
        'title': 'Меблі',
        'uriPicture': 'lib/assets/icons/cabinets.svg',
      },
      {
        'title': 'Підвіконня',
        'uriPicture': 'lib/assets/icons/sills.svg',
      },

    ];
    _alsoCleanOptionsDataList = [
      {
        'title': 'Наводимо лад',
        'uriPicture': 'lib/assets/icons/clean.svg',
      },
      {
        'title': 'Викидаємо сміття',
        'uriPicture': 'lib/assets/icons/trash.svg',
      },
      {
        'title': 'Міняємо мішки для сміття',
        'uriPicture': 'lib/assets/icons/garbage-bags.svg',
      },
      {
        'title': 'Миємо посуд',
        'uriPicture': 'lib/assets/icons/dishes.svg',
      },

    ];

    _selectionsDryCleaner =
        List.generate(_dryCleanerDataList.length, (index) => false);

    _dryCleanerOptionsCount =
        List.generate(_dryCleanerDataList.length, (index) {
          return 1;
        });

    _dryCleanerIncFunc = List.generate(_dryCleanerDataList.length, (index) {
      return () {
        _dryCleanerOptionsCount[index]++;
        notifyListeners();
      };
    });

    _dryCleanerDecFunc = List.generate(_dryCleanerDataList.length, (index) {
      return () {
        if (_dryCleanerOptionsCount[index] > 1) {
          _dryCleanerOptionsCount[index]--;
        }
        notifyListeners();
      };
    });




    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
  }

  bool get isInited {
    return true;
  }

  Future<void> loadUsers(int task_id) async {
    notifyListeners();
  }

  Future<void> onApplyReferal() async {
    notifyListeners();
  }

  List<Widget> innerOuterOptionsList() {
    return List.generate(
        _innerOuterOptionsDataList.length,
        (index) => ServiceWidget(
              title: _innerOuterOptionsDataList[index]['title'],
              image:   SvgPicture.asset(
                _innerOuterOptionsDataList[index]['uriPicture'],
                      // height: 30,
                    ),
            ));
  }

  List<Widget> wipeCleanOptionsList() {
    return List.generate(
        _wipeCleanOptionsDataList.length,
        (index) => ServiceWidget(
              title: _wipeCleanOptionsDataList[index]['title'],
              image:   SvgPicture.asset(
                _wipeCleanOptionsDataList[index]['uriPicture'],
                      // height: 30,
                    ),
            ));
  }
 List<Widget> alsoCleanOptionsList() {
    return List.generate(
        _alsoCleanOptionsDataList.length,
        (index) => ServiceWidget(
              title: _alsoCleanOptionsDataList[index]['title'],
              image:   SvgPicture.asset(
                _alsoCleanOptionsDataList[index]['uriPicture'],
                      // height: 30,
                    ),
            ));
  }

  List<Widget> dryCleanerList() {
    return List.generate(
        _dryCleanerDataList.length,
        (index) => ServiceWidgetExtend(
              title: _dryCleanerDataList[index]['title'],
              price: _dryCleanerDataList[index]['price'],
              textColor: selectionsDryCleaner[index] == true
                  ? Colors.white
                  : Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: selectionsDryCleaner[index] == true
                  ? AppColor.primary
                  : const Color.fromRGBO(248, 248, 248, 1),
              image: (selectionsDryCleaner[index] == true) &&
                      (!_dryCleanerDataList[index]['isSingle'])
                  ? CounterSecondaryWidget(
                      _dryCleanerOptionsCount[index],
                      onIncrementTap: _dryCleanerIncFunc[index],
                      onDecrementTap: _dryCleanerDecFunc[index],
                    )
                  : SvgPicture.asset(
                      _dryCleanerDataList[index]['uriPicture'],
                      // height: 30,
                    ),
            ));
  }

  List<Widget> repairCleanerOptionsList() {
    return List.generate(
        _repairCleanerOptionsDataList.length,
        (index) => ServiceWidgetExtend(
              title: _repairCleanerOptionsDataList[index]['title'],
              price: _repairCleanerOptionsDataList[index]['price'],
              textColor: selectionsCleanOptions[index] == true
                  ? Colors.white
                  : Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: selectionsCleanOptions[index] == true
                  ? AppColor.primary
                  : const Color.fromRGBO(248, 248, 248, 1),
              image: (selectionsCleanOptions[index] == true) &&
                      (!_repairCleanerOptionsDataList[index]['isSingle'])
                  ? CounterSecondaryWidget(
                      _cleanerOptionsCount[index],
                      onIncrementTap: _cleanerOptionsIncFunc[index],
                      onDecrementTap: _cleanerOptionsDecFunc[index],
                    )
                  : SvgPicture.asset(
                      _repairCleanerOptionsDataList[index]['uriPicture'],
                      height: 30,
                    ),
            ));
  }

  List<Widget> windowCleanerOptionsList() {
    return List.generate(
        _windowCleanerOptionsDataList.length,
        (index) => ServiceWidgetExtend(
              title: _windowCleanerOptionsDataList[index]['title'],
              price: _windowCleanerOptionsDataList[index]['price'],
              textColor: selectionsCleanOptions[index] == true
                  ? Colors.white
                  : Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: selectionsCleanOptions[index] == true
                  ? AppColor.primary
                  : const Color.fromRGBO(248, 248, 248, 1),
              image: (selectionsCleanOptions[index] == true) &&
                      (!_windowCleanerOptionsDataList[index]['isSingle'])
                  ? CounterSecondaryWidget(
                      _cleanerOptionsCount[index],
                      onIncrementTap: _cleanerOptionsIncFunc[index],
                      onDecrementTap: _cleanerOptionsDecFunc[index],
                    )
                  : SvgPicture.asset(
                      _windowCleanerOptionsDataList[index]['uriPicture'],
                      height: 30,
                    ),
            ));
  }

  List<Widget> handyManCleanerOptionsList() {
    return List.generate(
        _handyManOptionsDataList.length,
        (index) => ServiceWidgetExtend(
              title: _handyManOptionsDataList[index]['title'],
              price: _handyManOptionsDataList[index]['price'],
              textColor: selectionsHandyManOptions[index] == true
                  ? Colors.white
                  : Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: selectionsHandyManOptions[index] == true
                  ? AppColor.primary
                  : const Color.fromRGBO(248, 248, 248, 1),
              image: (selectionsHandyManOptions[index] == true) &&
                      (!_handyManOptionsDataList[index]['isSingle'])
                  ? CounterSecondaryWidget(
                      _handyManOptionsCount[index],
                      onIncrementTap: _cleanerOptionsIncFunc[index],
                      onDecrementTap: _cleanerOptionsDecFunc[index],
                    )
                  : SvgPicture.asset(
                      _handyManOptionsDataList[index]['uriPicture'],
                      height: 30,
                    ),
            ));
  }

  Widget cellCategory(String uriPic, String title) {
    return Container(
      decoration: AppDecoration.container,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  '$uriPic',
                  height: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    '$title',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(43, 43, 43, 1),
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFont.heavy),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  late List<Widget> categoriesList = <Widget>[
    cellCategory(
        'lib/assets/icons/electrician 1.svg', 'Електротехнічні послуги'),
    cellCategory('lib/assets/icons/carpenter 1.svg', 'Столярні послуги'),
    cellCategory('lib/assets/icons/handyman-order.svg', 'Слюсарні послуги'),
    cellCategory('lib/assets/icons/plumber.svg', 'Сантехнічні послуги'),
  ];

  List<Widget> handyManCleanerOptionsSubList(String category) {
    List<Map<String, dynamic>> sublist = [];

    _handyManOptionsDataList.forEach((element) {
      if (element['service'] == category) sublist.add(element);
    });

    return List.generate(
        sublist.length,
        (index) => ServiceWidgetExtend(
              title: sublist[index]['title'],
              price: sublist[index]['price'],
              textColor: selectionsHandyManOptions[index] == true
                  ? Colors.white
                  : Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: selectionsHandyManOptions[index] == true
                  ? AppColor.primary
                  : const Color.fromRGBO(248, 248, 248, 1),
              image: (selectionsHandyManOptions[index] == true) &&
                      (!sublist[index]['isSingle'])
                  ? CounterSecondaryWidget(
                      _handyManOptionsCount[index],
                      onIncrementTap: _cleanerOptionsIncFunc[index],
                      onDecrementTap: _cleanerOptionsDecFunc[index],
                    )
                  : SvgPicture.asset(
                      sublist[index]['uriPicture'],
                      height: 30,
                    ),
            ));
  }

  List<Widget> addCleanerOptionsList() {
    return List.generate(
        _dryCleanerDataList.length,
        (index) => ServiceWidgetExtend(
              title: _dryCleanerDataList[index]['title'],
              price: _dryCleanerDataList[index]['price'],
              textColor: selectionsDryCleaner[index] == true
                  ? Colors.white
                  : Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: selectionsDryCleaner[index] == true
                  ? AppColor.primary
                  : const Color.fromRGBO(248, 248, 248, 1),
              image: (selectionsDryCleaner[index] == true) &&
                      (!_dryCleanerDataList[index]['isSingle'])
                  ? CounterSecondaryWidget(
                      _dryCleanerOptionsCount[index],
                      onIncrementTap: _dryCleanerIncFunc[index],
                      onDecrementTap: _dryCleanerDecFunc[index],
                    )
                  : SvgPicture.asset(_dryCleanerDataList[index]['uriPicture']),
            ));
  }

  bool validate() {
    return false;
  }

  Future<void> reset() async {}

  List<Map<String, dynamic>> get discountDataList => _discountDataList;

  set discountDataList(List<Map<String, dynamic>> value) {
    _discountDataList = value;
  }

  int get selectedDiscountIndex => _selectedDiscountIndex;

  set selectedDiscountIndex(int value) {
    _selectedDiscountIndex = value;
    notifyListeners();
  }

  List<bool> get selectionsHuman => _selectionsHuman;

  set selectionsHuman(List<bool> value) {
    _selectionsHuman = value;
    notifyListeners();
  }


  List<bool> get selectionsCleanOptions => _selectionsCleanOptions;

  set selectionsCleanOptions(List<bool> value) {
    _selectionsCleanOptions = value;
    notifyListeners();
  }

  List<bool> get selectionsDryCleaner => _selectionsDryCleaner;

  setSelectionsDryCleaner(int index, bool value) {
    _selectionsDryCleaner[index] = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> get addCleanerOptionsDataList =>
      _dryCleanerDataList;

  bool get isExpandedOptions => _isExpandedOptions;

  set isExpandedOptions(bool value) {
    _isExpandedOptions = value;
    notifyListeners();
  }

  double get turns => _turns;

  set turns(double value) {
    _turns = value;
    notifyListeners();
  }

  List<bool> get selectionsSelectPay => _selectionsPayMethod;

  selectionsPayMethod(int index, bool value) {
    _selectionsPayMethod[index] = value;
    if ((index == 0) && (value)) _selectionsPayMethod[1] = false;
    if ((index == 1) && (value)) _selectionsPayMethod[0] = false;
    notifyListeners();
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


  String get refferal => _refferal;

  set refferal(String value) {
    _refferal = value;
  }

  List<bool> get selectionsHandyManOptions => _selectionsHandyManOptions;

  set selectionsHandyManOptions(List<bool> value) {
    _selectionsHandyManOptions = value;
    notifyListeners();
  }

  bool get isExpandedCleanOptions => _isExpandedCleanOptions;

  set isExpandedCleanOptions(bool value) {
    _isExpandedCleanOptions = value;
    notifyListeners();
  }

  Map<String, dynamic> get selectedCity => _selectedCity;

  set selectedCity(Map<String, dynamic> value) {
    _selectedCity = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> get listCities => _listCities;


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
}

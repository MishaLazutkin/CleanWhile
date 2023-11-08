import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_svg/svg.dart';
import 'package:group_button/group_button.dart';

import '../utils/style.dart';
import '../widgets/cell_small.dart';
import '../widgets/counter_secondary.dart';
import '../widgets/discount.dart';
import '../widgets/service_widget_ext.dart';

class DryCleanerProvider extends ChangeNotifier {
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

  late int _selectedDiscountId = -1;
  late List<Map<String, dynamic>> _discountDataList;
  late List<bool> _selectedTakeKeys=[false,false] ;
  late bool _isCheckedDelivery = false;
  late String _adressKeysBefore;
  late String _adressKeysAfter;
  late bool _isCheckedVacuum = false;
  late int _roomCount=0;
  late int _sanitaryUnitCount=0;
  late bool _isCheckedKitchen=false;
  late bool _isCheckedAnex=false;
  late bool _isCheckedPrivateHouse=false;

  late List<Map<String, dynamic>> _cleanerOptionsDataList;
  late List<Map<String, dynamic>> _handyManOptionsDataList;
  late List<Function> _cleanerOptionsIncFunc;
  late List<Function> _cleanerOptionsDecFunc;

  late List<Map<String, dynamic>> _dryCleanerDataList;
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
  late String _refferalCode;

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
    _discountDataList = [
      {
        'id': 1,
        'percent': '-20%',
        'title': 'Раз на тиждень',
        'price': '119.92 zł'
      },
      {
        'id': 2,
        'percent': '-15%',
        'title': 'Раз на два тижні',
        'price': '127.42 zł'
      },
      {
        'id': 3,
        'percent': '-10%',
        'title': 'Раз на місяць',
        'price': '134.91 zł'
      },
      {'id': 4, 'title': 'Разове прибирання', 'price': '149.90 zł'},
    ];

    _cleanerOptionsDataList = [
      {
        'title': 'Миття духової шафи',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/oven.svg',
        'isSingle': true,
      },
      {
        'title': 'Миття витяжки',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/hood.svg',
        'isSingle': true,
      },
      {
        'title': 'Прибирання в кухоних шафах',
        'price': '55 zł',
        'uriPicture': 'lib/assets/icons/cabinets.svg',
        'isSingle': true,
      },
      {
        'title': 'Миття посуду',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/dishes.svg',
        'isSingle': false,
      },
      {
        'title': 'Миття холодильника',
        'price': '30 zł',
        'uriPicture': 'lib/assets/icons/fridge.svg',
        'isSingle': false,
      },
      {
        'title': 'Миття мікрохвильовки',
        'price': '15 zł',
        'uriPicture': 'lib/assets/icons/microoven.svg',
        'isSingle': true,
      },
      {
        'title': 'Прибирання балкона',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/balcony.svg',
        'isSingle': false,
      },
      {
        'title': 'Помиємо вікна з внутрішної сторони (шт.)',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/windows.svg',
        'isSingle': false,
      },
      {
        'title': 'Прасування',
        'price': '45 zł',
        'uriPicture': 'lib/assets/icons/ironing.svg',
        'isSingle': false,
      },
      {
        'title': 'Прибрати лоток для тварин',
        'price': '10 zł',
        'uriPicture': 'lib/assets/icons/tray.svg',
        'isSingle': false,
      },
      {
        'title': 'Додаткові години',
        'price': '45 zł',
        'uriPicture': 'lib/assets/icons/hours.svg',
        'isSingle': false,
      },
      {
        'title': 'Прибирання гардеробу',
        'price': '20 zł',
        'uriPicture': 'lib/assets/icons/wardrobe.svg',
        'isSingle': false,
      },
      {
        'title': 'Прибрати в шафі',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/closet.svg',
        'isSingle': false,
      },
    ];

    _repairCleanerOptionsDataList = [
      {
        'title': 'Вікна після ремонту',
        'price': '145 zł',
        'uriPicture': 'lib/assets/icons/window-order.svg',
        'isSingle': true,
      },
      {
        'title': 'Площа',
        'price': '6 zł',
        'uriPicture': 'lib/assets/icons/area.svg',
        'isSingle': true,
      },
    ];

    _windowCleanerOptionsDataList = [
      {
        'title': 'Миття вікон',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/window-order.svg',
        'isSingle': true,
      },
      {
        'title': 'Прибирання балкона',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/balcony.svg',
        'isSingle': true,
      },
    ];

    _handyManOptionsDataList = [
      {
        'title': 'Монтаж підвісу картин, дощок і т.д',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/frame.svg',
        'isSingle': true,
        'service': 'carpenter',
      },
      {
        'title': 'Підключення електричної варильної панелі',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/hob.svg',
        'isSingle': true,
        'service': 'electric'
      },
      {
        'title': 'Заміна замка на поштовій скринці',
        'price': '55 zł',
        'uriPicture': 'lib/assets/icons/mailbox.svg',
        'isSingle': true,
        'service': 'locksmith'
      },
      {
        'title': 'Ремонт люстри світильника',
        'price': '125 zł',
        'uriPicture': 'lib/assets/icons/lamp.svg',
        'isSingle': false,
        'service': 'electric'
      },
      {
        'title': 'Встановлення/заміна/ремонт дверної ручки',
        'price': '130 zł',
        'uriPicture': 'lib/assets/icons/door-handle.svg',
        'isSingle': false,
        'service': 'locksmith'
      },
      {
        'title': 'Електрична діагностіка',
        'price': '115 zł',
        'uriPicture': 'lib/assets/icons/generator.svg',
        'isSingle': true,
        'service': 'electric'
      },
      {
        'title': 'Заміна змішувача',
        'price': '125 zł',
        'uriPicture': 'lib/assets/icons/tap.svg',
        'isSingle': false,
        'service': 'locksmith'
      },
      {
        'title': 'Встановлення/заміна циліндра дверного замка',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/padlock.svg',
        'isSingle': false,
        'service': 'locksmith'
      },
      {
        'title': 'Встановлення/заміна вимикача',
        'price': '45 zł',
        'uriPicture': 'lib/assets/icons/power-switch.svg',
        'isSingle': false,
        'service': 'electric'
      },
      {
        'title': 'Встановлення/заміна сифона в умивальнику',
        'price': '10 zł',
        'uriPicture': 'lib/assets/icons/siphon.svg',
        'isSingle': false,
        'service': 'plumber'
      },
      {
        'title': 'Ремонт та регулювання алюмінієвих дверей',
        'price': '45 zł',
        'uriPicture': 'lib/assets/icons/door.svg',
        'isSingle': false,
        'service': 'locksmith'
      },
      {
        'title': 'Підключення/установка пральної машини',
        'price': '20 zł',
        'uriPicture': 'lib/assets/icons/washing-machine.svg',
        'isSingle': false,
        'service': 'plumber'
      },
      {
        'title': 'Ремонт ліжок та диванів',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/bed-2.svg',
        'isSingle': false,
        'service': 'carpenter'
      },
      {
        'title': 'Підключення/установка посудомийної машини',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/dishwasher-2.svg',
        'isSingle': false,
        'service': 'plumber'
      },
      {
        'title': 'Складання меблів',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/furniture-2.svg',
        'isSingle': false,
        'service': 'carpenter'
      },
      {
        'title': 'Установка вентилятора у ванній кімнаті',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/fan.svg',
        'isSingle': false,
        'service': 'plumber'
      },
      {
        'title': 'Ремонт розсувних шаф-купе/приклеювання дзеркал',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/cupboard.svg',
        'isSingle': false,
        'service': 'carpenter'
      },
      {
        'title': 'Установка біде',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/bidet.svg',
        'isSingle': false,
        'service': 'plumber'
      },
      {
        'title': 'Заміна/установка/петель на дверцятах холодильника',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/hinge.svg',
        'isSingle': false,
        'service': 'carpenter'
      },
      {
        'title': 'Встановлення умивальника',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/sink-2.svg',
        'isSingle': false,
        'service': 'plumber'
      },
      {
        'title': 'Реалізація електроточки',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/flow-graphic.svg',
        'isSingle': false,
        'service': 'electric'
      },
      {
        'title': 'Установка унітазу',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/toilet.svg',
        'isSingle': false,
        'service': 'plumber'
      },
      {
        'title': 'Заміна запобіжників',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/fuse-box(1).svg',
        'isSingle': false,
        'service': 'electric'
      },
      {
        'title': 'Встановлення пісуару',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/urinal.svg',
        'isSingle': false,
        'service': 'plumber'
      },
      {
        'title': 'Заміна лампи розжарювання, галогенної, флуоресцентної лампи',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/fluorescent-light 1.svg',
        'isSingle': false,
        'service': 'electric'
      },
      {
        'title':
            'Заміна/установка шлангів для змішувача у ванній, раковині, умивальнику',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/hose.svg',
        'isSingle': false,
        'service': 'plumber'
      },
      {
        'title': 'Встановлення/заміна електричної розетки',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/plug-in.svg',
        'isSingle': false,
        'service': 'electric'
      },
      {
        'title': 'Демонтаж (біде, раковина, сидіння для унітазу, пісуар)',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/delete.svg',
        'isSingle': false,
        'service': 'plumber'
      },
      {
        'title': 'Монтаж/заміна люстри з лампою',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/ceiling-lamp (1).svg',
        'isSingle': false,
        'service': 'electric'
      },
      {
        'title': 'Установка карнизів для штор',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/curtain.svg',
        'isSingle': false,
        'service': 'locksmith'
      },
      {
        'title': 'Встановлення/заміна електричного трансформатора',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/electrical-panel (1).svg',
        'isSingle': false,
        'service': 'electric'
      },
      {
        'title': 'Встановлення/заміна полиці, дзеркала',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/mirror.svg',
        'isSingle': false,
      },
      {
        'title': 'Ремонт електричних з\'єднань',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/plug (1).svg',
        'isSingle': false,
        'service': 'electric'
      },
    ];

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

    _selectionsCleanOptions =
        List.generate(_cleanerOptionsDataList.length, (index) => false);

    _selectionsHandyManOptions =
        List.generate(_handyManOptionsDataList.length, (index) => false);

    _selectionsDryCleaner =
        List.generate(_dryCleanerDataList.length, (index) => false);

    _cleanerOptionsIncFunc =
        List.generate(_cleanerOptionsDataList.length, (index) {
      switch (index) {
        case 0:
          return () {};
        case 1:
          return () {};
        case 2:
          return () {};
        case 3:
          return () {
            _cleanerOptionsCount[index]++;
            notifyListeners();
          };
        case 4:
          return () {
            _cleanerOptionsCount[index]++;
            notifyListeners();
          };
        case 5:
          return () {};
        case 6:
          return () {
            _cleanerOptionsCount[index]++;
            notifyListeners();
          };
        case 7:
          return () {
            _cleanerOptionsCount[index]++;
            notifyListeners();
          };
        case 8:
          return () {
            _cleanerOptionsCount[index]++;
            notifyListeners();
          };
        case 9:
          return () {
            _cleanerOptionsCount[index]++;
            notifyListeners();
          };
        case 10:
          return () {
            _cleanerOptionsCount[index]++;
            notifyListeners();
          };
        case 11:
          return () {
            _cleanerOptionsCount[index]++;
            notifyListeners();
          };
        case 12:
          return () {
            _cleanerOptionsCount[index]++;
            notifyListeners();
          };
        default:
          return () {};
      }
    });

    _dryCleanerIncFunc =
        List.generate(_dryCleanerDataList.length, (index) {
      return () {
        _dryCleanerOptionsCount[index]++;
        notifyListeners();
      };
    });

    _dryCleanerDecFunc =
        List.generate(_dryCleanerDataList.length, (index) {
      return () {
        if (_dryCleanerOptionsCount[index] > 1) {
          _dryCleanerOptionsCount[index]--;
        }
        notifyListeners();
      };
    });

    _cleanerOptionsDecFunc =
        List.generate(_cleanerOptionsDataList.length, (index) {
      switch (index) {
        case 0:
          return () {};
        case 1:
          return () {};
        case 2:
          return () {};
        case 3:
          return () {
            if (_cleanerOptionsCount[index] > 1) {
              _cleanerOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 4:
          return () {
            if (_cleanerOptionsCount[index] > 1) {
              _cleanerOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 5:
          return () {};
        case 6:
          return () {
            if (_cleanerOptionsCount[index] > 1) {
              _cleanerOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 7:
          return () {
            if (_cleanerOptionsCount[index] > 1) {
              _cleanerOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 8:
          return () {
            if (_cleanerOptionsCount[index] > 1) {
              _cleanerOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 9:
          return () {
            if (_cleanerOptionsCount[index] > 1) {
              _cleanerOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 10:
          return () {
            if (_cleanerOptionsCount[index] > 1) {
              _cleanerOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 11:
          return () {
            if (_cleanerOptionsCount[index] > 1) {
              _cleanerOptionsCount[index]--;
            }
            notifyListeners();
          };
        case 12:
          return () {
            if (_cleanerOptionsCount[index] > 1) {
              _cleanerOptionsCount[index]--;
            }
            notifyListeners();
          };
        default:
          return () {};
      }
    });

    _cleanerOptionsCount =
        List.generate(_cleanerOptionsDataList.length, (index) {
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

    _handyManOptionsCount =
        List.generate(_handyManOptionsDataList.length, (index) {
      return 1;
    });

    _dryCleanerOptionsCount =
        List.generate(_dryCleanerDataList.length, (index) {
      return 1;
    });
    Future.delayed(Duration.zero,(){notifyListeners();});

  }

  bool get isInited {
    return true;
  }
  Future<void> onApplyPromo( ) async {
    notifyListeners();
  }

  Future<void> onApplyReferal() async {
    notifyListeners();
  }
  Future<void> loadUsers(int task_id) async {
    notifyListeners();
  }

  List<Widget> discountList() {
    return List.generate(
        _discountDataList.length,
        (index) => Discount(
              percent: _discountDataList[index].containsKey('percent')
                  ? CellSmall(_discountDataList[index]['percent'])
                  : Container(
                      height: 30,
                      child: SvgPicture.asset(
                        'lib/assets/icons/😔.svg',
                      )),
              title: _discountDataList[index]['title'],
              price: _discountDataList[index]['price'],
              textColor:
              _selectedDiscountId   == index ? Colors.white : Colors.black,
          backgroundColor: _selectedDiscountId == index
              ? AppColor.primary
              : const Color.fromRGBO(255, 255, 255, 1),
            ));
  }

  List<Widget> cleanerOptionsList() {
    return List.generate(
        _cleanerOptionsDataList.length,
        (index) => ServiceWidgetExtend(
              title: _cleanerOptionsDataList[index]['title'],
              price: _cleanerOptionsDataList[index]['price'],
              textColor: selectionsCleanOptions[index] == true
                  ? Colors.white
                  : Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: selectionsCleanOptions[index] == true
                  ? AppColor.primary
                  : const Color.fromRGBO(248, 248, 248, 1),
              image: (selectionsCleanOptions[index] == true) &&
                      (!_cleanerOptionsDataList[index]['isSingle'])
                  ? CounterSecondaryWidget(
                      _cleanerOptionsCount[index],
                      onIncrementTap: _cleanerOptionsIncFunc[index],
                      onDecrementTap: _cleanerOptionsDecFunc[index],
                    )
                  : SvgPicture.asset(
                      _cleanerOptionsDataList[index]['uriPicture'],
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
              textColor:
              selectionsDryCleaner[index] == true
                  ? Colors.white
                  :

              Color.fromRGBO(64, 64, 64, 1),
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


   List<Map<String, dynamic>> sublist =[];

   _handyManOptionsDataList.forEach((element) {
     if(element['service']==category) sublist.add(element);
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
                  : SvgPicture.asset(
                      _dryCleanerDataList[index]['uriPicture']),
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

  int get selectedDiscountId => _selectedDiscountId;

  set selectedDiscountId(int value) {
    _selectedDiscountId = value;
    notifyListeners();
  }


  List<bool> get selectionsHuman => _selectionsHuman;

  set selectionsHuman(List<bool> value) {
    _selectionsHuman = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> get cleanerOptionsDataList =>
      _cleanerOptionsDataList;

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

  String get refferalCode => _refferalCode;

  set refferalCode(String value) {
    _refferalCode = value;
    notifyListeners();
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

  bool get isCheckedVacuum => _isCheckedVacuum;

  set isCheckedVacuum(bool value) {
    _isCheckedVacuum = value;
    notifyListeners();
  }
  bool get isCheckedPrivateHouse => _isCheckedPrivateHouse;

  set isCheckedPrivateHouse(bool value) {
    _isCheckedPrivateHouse = value;
    notifyListeners();
  }

  bool get isCheckedAnex => _isCheckedAnex;

  set isCheckedAnex(bool value) {
    _isCheckedAnex = value;
    notifyListeners();
  }

  bool get isCheckedKitchen => _isCheckedKitchen;

  set isCheckedKitchen(bool value) {
    _isCheckedKitchen = value;
    notifyListeners();
  }

  int get sanitaryUnitCount => _sanitaryUnitCount;

  set sanitaryUnitCount(int value) {
    _sanitaryUnitCount = value;
    notifyListeners();
  }

  int get roomCount => _roomCount;

  set roomCount(int value) {
    _roomCount = value;
    notifyListeners();
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

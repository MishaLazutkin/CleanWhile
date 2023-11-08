import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_svg/svg.dart';

import '../repositories/api.dart';
import '../utils/style.dart';
import '../widgets/cell_small.dart';
import '../widgets/counter_secondary.dart';
import '../widgets/discount.dart';
import '../widgets/service_widget_ext.dart';

class HomeProvider extends ChangeNotifier {
  late List<Map<String, dynamic>> _listCities;
  late List<String> _languages;

  late int _selectedLangIndex;
  late int _selectedTabIndex ;

  late List<Map<String, String>> _tabList;
  late List<Map<String, dynamic>>? _listServices = [];


  Future<void> init() async {
    _selectedTabIndex=0;
  // await loadServices();
    print('_selectedTabIndex ${_selectedTabIndex}');


    _tabList = [
      {'title':'Звичайне', 'uri':'lib/assets/icons/default-order.svg'},
      {'title':'Ремонт', 'uri':'lib/assets/icons/repair-order.svg'},
      {'title':'Миття вiкон', 'uri':'lib/assets/icons/window-order.svg'},
      {'title':'Хiмчистка', 'uri':'lib/assets/icons/sofa-order.svg'},
      {'title':'Чоловiк на годину', 'uri':'lib/assets/icons/handyman-order.svg'},
      {'title':'Офiс', 'uri':'lib/assets/icons/office-order.svg'},
      {'title':'Cars', 'uri':'lib/assets/icons/car-order.svg'},
      {'title':'Будинок i котедж', 'uri':'lib/assets/icons/private-house-order.svg'},
      {'title':'Кухня', 'uri':'lib/assets/icons/kitchen-order.svg'},
      {'title':'Подорувати прибирання', 'uri':'lib/assets/icons/present-order.svg'},

    ];

    _listCities = [
    {
    'title': 'Warshawa',
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
    _languages = <String>['Українська','English','Латвійська','Німецька','Польська','Росiйська','Чеська','Бiлоруська'];
    _selectedLangIndex = 0;
    Future.delayed(Duration.zero, () {
    notifyListeners();
    });
  }

  bool get isInited {
    return true;
  }


  Future<void> loadServices() async {
    final responce = await Api().loadServices({});
    _listServices = responce?.services?.data?.services
        ?.map((service) => service.toJson())
        ?.toList();
    print('_listServices: ${_listServices.toString()}');

    notifyListeners();
  }


  bool validate() {
    return false;
  }

  Future<void> reset() async {}

  List<Map<String, dynamic>> get listCities => _listCities;

  List<String> get languages => _languages;

  int get selectedLangIndex => _selectedLangIndex;

  set selectedLangIndex(int value) {
    _selectedLangIndex = value;
    notifyListeners();
  }

  List<Map<String, String>> get tabList => _tabList;

  int get selectedTabIndex => _selectedTabIndex;

  set selectedTabIndex(int value) {
    _selectedTabIndex = value;
    notifyListeners();
  }

  List<Map<String, dynamic>>? get listServices => _listServices;
}

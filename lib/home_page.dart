import 'package:clean_whale/services/connectivity_service/connectivity_service.dart';
import 'package:clean_whale/utils/style.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'widgets/all.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with FullscreenLoaderMixin<HomePage>, TickerProviderStateMixin {
  static late TabController _bottomTabController;
  static Map source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  late int _currentBottomTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _initBottomTabController();
    _networkConnectivity.initialise();
    _networkConnectivity.connectivityStream.listen((ssource) {
      source = ssource;

      if (source.keys.toList()[0] == ConnectivityResult.none) {
        showToast(_networkConnectivity.string);
      }
    });
  }

 static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: "$msg",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void dispose() {
    _bottomTabController.dispose();
    _networkConnectivity.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.backgroundPage,
          body: DefaultTabController(
            length: 5,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                TabBarView(
                  controller: _bottomTabController,
                  children: [
                    _servicesTab(),
                    _bonusesTab(),
                    _createOrderTab(),
                    _ordersTab(),
                    _profileTab(),
                  ],
                ),
              ],
            ),
          ),
        ),
        // if (showLoader)
        //   const FullscreenLoader(
        //     showGrayBackground: true,
        //   ),
      ],
    );
  }

  Widget _servicesTab() {
    return const ServicesTab();
  }

  Widget _bonusesTab() {
    return const BonusesTab();
  }

  Widget _createOrderTab() {
    return const CreateOrderTab();
  }

  Widget _ordersTab() {
    return const OrdersTab();
  }

  Widget _profileTab() {
    return const Center(child: LoginPage());
  }

  //
  // void _initHeadTabController() {
  //   headerTabController = TabController(vsync: this, length: 10)
  //     ..addListener(() {
  //       setState(() {
  //        // _currentBottomTabIndex = headerTabController.index;
  //         print('_currentBottomTabIndex $_currentBottomTabIndex');
  //         switch (headerTabController.index) {
  //           case 0:
  //             break;
  //           case 1:
  //             break;
  //           case 2:
  //             break;
  //         }
  //       });
  //     });
  // }

  void _initBottomTabController() {
    _bottomTabController = TabController(vsync: this, length: 5)
      ..addListener(() {
        setState(() {
          _currentBottomTabIndex = _bottomTabController.index;
          print('_currentBottomTabIndex $_currentBottomTabIndex');
          switch (_bottomTabController.index) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
          }
        });
      });
  }
}

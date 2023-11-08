import 'package:clean_whale/bottom_bar/bonuses_tab.dart';
import 'package:clean_whale/bottom_bar/orders_tab.dart';
import 'package:clean_whale/bottom_bar/profile_tabs/login_page.dart';
import 'package:clean_whale/services/navigation_service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bottom_bar/services_tab.dart';
import '../utils/style.dart';
import '../bottom_bar/create_order_tabs/create_order_tab.dart';

@immutable
class CustomBottomBar extends StatefulWidget {
  final int currentIndex;

  CustomBottomBar(this.currentIndex);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  double floatingButtonSize = 8;

  void _onTap(BuildContext context, int index) {
    Widget? page;
    switch (index) {
      case 0:
        page = const ServicesTab();
        break;
      case 1:
        page = const BonusesTab();
        break;

      case 2:
        page = const CreateOrderTab();
        _animateButton();
        break;
      case 3:
        page = const OrdersTab();
        break;
      case 4:
        page = const LoginPage();

        break;

      default:
        break;
    }
    if (page != null) {
      _navigateTo(
        context,
        index,
        WillPopScope(
          onWillPop: () async => true,
          child: page,
        ),
      );
    }
  }

  void _animateButton() {
    setState(() {
      floatingButtonSize = floatingButtonSize == 8 ? 10 : 8;
      Future.delayed(
          const Duration(
            milliseconds: 100,
          ), () {
        floatingButtonSize = floatingButtonSize == 8 ? 10 : 8;
      });
    });
  }

  void _navigateTo(BuildContext context, int index, Widget page) {
    NavigationService().push(context, page,withoutAnimation: true);
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.transparent,
      elevation: 0.0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                elevation: 10,
                child: Container(
                  height: AppValues.bottomBarHeight,
                  decoration: const BoxDecoration(
                    color: AppColor.backgroundBottomBar,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _button(context, 0, 'lib/assets/icons/cleaning_tab.png',
                          'Послуги'),
                      _button(context, 1, 'lib/assets/icons/bonuses_tab.png',
                          'Бонуси'),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5 - 5,
                      ),
                      _button(context, 3, 'lib/assets/icons/orders_tab.png',
                          'Замовлення'),
                      _button(context, 4, 'lib/assets/icons/profile_tab.png',
                          'Профіль'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width / 5 - 5,
            height: 80,
            child: Column(
              children: [
                _plusButton(context, 2, 'lib/assets/icons/cleaning_tab.png'),
                //SizedBox(height: 10,)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _plusButton(
    BuildContext context,
    int index,
    String iconPath,
  ) {
    final _isCurrent = index == widget.currentIndex;
    return GestureDetector(
      onTap: _isCurrent ?  null : () {
        _onTap(context, index);
      },
      child: ClipOval(
        child: Center(
          child: Container(
            color: Colors.white,
            height: 60.0,
            width: 67.0,
            child: Padding(
              padding: EdgeInsets.only(top: floatingButtonSize),
              child: Container(
                  decoration: const BoxDecoration(
                      color: AppColor.primary, shape: BoxShape.circle),
                  child: Center(
                    child: SvgPicture.asset(
                      'lib/assets/icons/plus.svg',
                      color: Colors.white,
                      height: 21,
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget _button(
    BuildContext context,
    int index,
    String iconPath,
    String title,  ) {
    final _isCurrent = index == widget.currentIndex;
    return GestureDetector(
      onTap: _isCurrent ? null : () => _onTap(context, index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width / 5 - 5,
            alignment: AlignmentDirectional.center,
            child: Stack(
              children: [
                Image.asset(iconPath,
                    color: _isCurrent ? AppColor.primary : AppColor.secondary),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: AppFont.heavy,
                color: _isCurrent
                    ? AppColor.primary
                    : const Color.fromRGBO(192, 192, 192, 1)),
          )
        ],
      ),
    );
  }
}

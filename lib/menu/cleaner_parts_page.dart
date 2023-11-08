import 'package:clean_whale/utils/style.dart';
import 'package:clean_whale/widgets/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../menu.dart';
import '../providers/info_provider.dart';
import '../widgets/header.dart';
import '../widgets/info/discount.dart';
import '../widgets/info/flat_price.dart';
import 'bathroom_body.dart';
import 'gang_body.dart';
import 'kitchen_body.dart';
import 'room_body.dart';

class CleanerParts extends StatefulWidget {
  const CleanerParts({Key? key}) : super(key: key);

  @override
  State<CleanerParts> createState() => _CleanerPartsState();
}

class _CleanerPartsState extends State<CleanerParts> {
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPage,
      appBar: CustomHeader(),
      endDrawer: const DrawerMenu(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text('Що входить в прибирання квартири',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.primaryTitleInfoPages),
              const SizedBox(
                height: 40,
              ),
              _menuSection(context),
              const SizedBox(
                height: 25,
              ),
              _getBody(),
            ],
          ),
        ),
      ),
      bottomNavigationBar:   CustomBottomBar(2),
    );
  }

  Widget _menuSection(BuildContext context) {
    final List<String> _items = [
      'У кімнаті',
      'В коридорі',
      'кухня',
      'санвузол',
    ];
    return CustomGridView(
      padding: const EdgeInsets.only(top: 0),

      listWidget: List.generate(
          _items.length,
          (index) => InkWell(
                onTap: () => setState(() {
                  selectedItemIndex = index;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: selectedItemIndex == index
                          ? AppColor.primary
                          : AppColor.backgroundGridViewItem,
                      borderRadius:
                          BorderRadius.circular(AppValues.regularCornerRadius)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Text(
                        '${_items[index]}'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppFont.heavy,
                            fontWeight: FontWeight.w400,
                            color: selectedItemIndex == index
                                ? const Color.fromRGBO(255, 255, 255, 1)
                                : const Color.fromRGBO(43, 43, 43, 1)),
                      ),
                    ),
                  ),
                ),
              )),
    );
  }

  Widget _getBody() {
    switch (selectedItemIndex) {
      case 0:
        return RoomBody();

      case 1:
        return GangBody();
      case 2:
        return KitchenBody();
      case 3:
        return BathroomBody();

      default:
        return RoomBody();
    }
  }
}

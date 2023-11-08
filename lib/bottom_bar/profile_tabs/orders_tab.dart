import 'package:carousel_slider/carousel_slider.dart';
import 'package:clean_whale/widgets/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/profile_provider.dart';
import '../../utils/style.dart';
import '../../widgets/custom_elevated_button.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return provider.myOrders.isNotEmpty ? _showOrdersList() : _showEmpty();
      },
    );
  }

  Widget _showOrdersList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          _listOrders(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _showEmpty() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          _makeFirstOrder(),
          const SizedBox(
            height: 70,
          ),
          _yourFirstOrder(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _makeFirstOrder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(89, 183, 139, 1),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Center(
          child: ListTile(
            leading: SvgPicture.asset(
              'lib/assets/icons/first_order.svg',
              width: 62,
            ),
            title: const Text('Зробити перше замовлення',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: AppFont.heavy,
                    color: Color.fromRGBO(43, 43, 43, 1))),
            subtitle: const Padding(
              padding: EdgeInsets.only(top: 9.0),
              child: Text('Промокод Start - знижка 15% на перше замовлення',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(43, 43, 43, 1))),
            ),
          ),
        ),
      ),
    );
  }

  Widget _listOrders() {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Center(
          child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: provider.myOrders.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppValues.regularCornerRadius),
                    color: AppColor.expansionTile,
                  ),
                  child: ExpansionTile(
                    childrenPadding: EdgeInsets.all(0),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    tilePadding: const EdgeInsets.only(right: 16),
                    collapsedBackgroundColor:
                        AppColor.containersBackgroundColor,
                    leading: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(228, 228, 228, 1),
                          borderRadius: BorderRadius.circular(
                              AppValues.regularCornerRadius)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              provider.myOrders[index]['hesh'],
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: AppFont.heavy),
                            ),
                          ),
                        ],
                      ),
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'lib/assets/icons/uil_calendar-alt.svg'),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  provider.myOrders[index]['date'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(64, 64, 64, 1),
                                      fontFamily: AppFont.heavy),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          flex: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'lib/assets/icons/ic_round-access-time.svg'),
                              const SizedBox(width: 9),
                              Expanded(
                                child: Text(provider.myOrders[index]['time'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(64, 64, 64, 1),
                                        fontFamily: AppFont.heavy)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    iconColor: const Color.fromRGBO(119, 119, 119, 1),
                    children: [
                      Container(
                        color: AppColor.backgroundPage,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('lib/assets/icons/place 1.png'),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: Text(
                                        '${provider.myOrders[index]['adress']}',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: AppFont.heavy))),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                    'lib/assets/icons/debit-cards 1.png'),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: Text(
                                        '${provider.myOrders[index]['pay']}',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: AppFont.heavy))),
                              ],
                            ),
                            const SizedBox(
                              height: 23,
                            ),
                            Text('${provider.myOrders[index]['title']}',
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: AppFont.heavy)),
                            const SizedBox(
                              height: 17,
                            ),
                            const DottedLine(),
                            const SizedBox(
                              height: 17,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text('Розрахунок виконує:',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: AppFont.heavy)),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'lib/assets/icons/mdi_user.svg'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                            '${provider.myOrders[index]['performedBy']}',
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(0, 0, 0, 1),
                                                fontFamily: AppFont.heavy)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Row(
                              children: [CellSmall('20 zl')],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomElevatedButton(
                              context: context,
                              uriPic:
                                  'lib/assets/icons/mingcute_repeat-line.svg',
                              title: 'Повторити замовлення',
                              alignment: Alignment.center,
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: AppFont.heavy,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                              height: 40,
                              bgColor: Color.fromRGBO(234, 236, 137, 0.61),
                              onTap: () {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomElevatedButton(
                              context: context,
                              uriPic:
                                  'lib/assets/icons/material-symbols_star.svg',
                              title: 'Поставити оцінку за замовлення ',
                              alignment: Alignment.center,
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: AppFont.heavy,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                              height: 40,
                              bgColor: Color.fromRGBO(247, 247, 247, 1),
                              onTap: () {},
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),

          // ExpandedTileList.builder(
          //   itemCount: provider.myOrders.length,
          //   maxOpened: 2,
          //   reverse: true,
          //   itemBuilder: (context, index, controller) {
          //     return
          //
          //
          //       ExpandedTile(
          //       theme: const ExpandedTileThemeData(
          //         headerColor: Color.fromRGBO(228, 228, 228, 1),
          //         headerRadius: 4.0,
          //         headerPadding: EdgeInsets.only(right: 16.0),
          //         headerSplashColor: Color.fromRGBO(247, 247, 247, 1),
          //         //
          //         // contentBackgroundColor: Colors.blue,
          //         contentPadding: EdgeInsets.all(24.0),
          //         contentRadius: 12.0,
          //       ),
          //       controller: index == 2
          //           ? controller.copyWith(isExpanded: true)
          //           : controller,
          //       trailing: Container(
          //           //color: Color.fromRGBO(247, 247, 247, 1),
          //          // height: 54,
          //
          //           child:
          //               SvgPicture.asset('lib/assets/icons/vector_item.svg')),
          //       trailingRotation: 180,
          //       title: Container(
          //         height: 54,
          //         decoration: BoxDecoration(
          //             color: const Color.fromRGBO(247, 247, 247, 1),
          //             borderRadius:
          //                 BorderRadius.circular(AppValues.regularCornerRadius)),
          //         child: Container(
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 decoration: BoxDecoration(
          //                     color: const Color.fromRGBO(228, 228, 228, 1),
          //                     borderRadius: BorderRadius.circular(
          //                         AppValues.regularCornerRadius)),
          //                 child: Column(
          //                   children: [
          //                     Text(provider.myOrders[index]['hesh']),
          //                   ],
          //                 ),
          //               ),
          //               Container(
          //                   child: Row(
          //                 children: [
          //                   SvgPicture.asset(
          //                       'lib/assets/icons/uil_calendar-alt.svg'),
          //                   const SizedBox(width: 9),
          //                   Text(provider.myOrders[index]['date'])
          //                 ],
          //               )),
          //               Container(
          //                   child: Row(
          //                 children: [
          //                   SvgPicture.asset(
          //                       'lib/assets/icons/ic_round-access-time.svg'),
          //                   const SizedBox(width: 9),
          //                   Text(provider.myOrders[index]['time'])
          //                 ],
          //               )),
          //             ],
          //           ),
          //         ),
          //       ),
          //       content: Container(
          //         color: Colors.red,
          //         child: Column(
          //           children: [
          //             const Center(
          //               child: Text(
          //                   "This is the content!ksdjfl kjsdflk sjdflksjdf lskjfd lsdkfj  ls kfjlsfkjsdlfkjsfldkjsdflkjsfdlksjdflskdjf lksdjflskfjlsfkjslfkjsldfkjslfkjsldfkjsflksjflskjflskfjlsfkjslfkjsflksjflskfjlsfkjslfkjslfkjslfkjslfkjsldfkjsdf"),
          //             ),
          //             MaterialButton(
          //               onPressed: () {
          //                 controller.collapse();
          //               },
          //               child: const Text("close it!"),
          //             )
          //           ],
          //         ),
          //       ),
          //       onTap: () {
          //         debugPrint("tapped!!");
          //       },
          //       onLongTap: () {
          //         debugPrint("looooooooooong tapped!!");
          //       },
          //     );
          //   },
          // ),
        );
      },
    );
  }

  Widget _yourFirstOrder() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Flexible(
              child: Text('Оформити перше замовлення',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(163, 163, 163, 1))),
            ),
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        Container(
          padding: const EdgeInsets.all(29),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(35, 87, 197, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              SvgPicture.asset('lib/assets/icons/plus.svg',
                  color: Colors.white),
              const SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                    child: Text('Оформити замовлення',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            fontFamily: AppFont.heavy,
                            color: Color.fromRGBO(255, 255, 255, 1))),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

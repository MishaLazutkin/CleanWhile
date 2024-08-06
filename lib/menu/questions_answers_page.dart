import 'package:clean_whale/utils/style.dart';
import 'package:clean_whale/widgets/all.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../menu.dart';
import '../providers/info_provider.dart';
import '../widgets/header.dart';

class QuestionsAnswers extends StatefulWidget {
  const QuestionsAnswers({Key? key}) : super(key: key);

  @override
  State<QuestionsAnswers> createState() => _QuestionsAnswersState();
}

class _QuestionsAnswersState extends State<QuestionsAnswers> {
  // late bool _isExpanded=false;

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
              const Text('Поширені запитання',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.primaryTitleInfoPages),
              const SizedBox(
                height: 34,
              ),
              _listQuestions(),
              const SizedBox(
                height: 75,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(2),
    );
  }

  Widget _listQuestions() {
    int currentIndex;
    return Consumer<InfoProvider>(
      builder: (context, provider, child) {
        return Center(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: provider.questionsDataList.length,
            itemBuilder: (ctx, index) {
              currentIndex = index;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppValues.regularCornerRadius),
                    color: AppColor.expansionTile,
                  ),
                  child: ExpansionTile(
                    childrenPadding: const EdgeInsets.all(0),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    tilePadding: const EdgeInsets.only(right: 16),
                    collapsedBackgroundColor:
                        AppColor.containersBackgroundColor,
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                provider.questionsDataList[index]['title'],
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(43, 43, 43, 1),
                                    fontFamily: AppFont.heavy),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                    text: 'Всього питань: ',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(43, 43, 43, 0.55),
                                        fontFamily: AppFont.heavy),
                                    children: [
                                      TextSpan(
                                        text: '5',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromRGBO(43, 43, 43, 1),
                                            fontFamily: AppFont.heavy),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: SizedBox(),
                    children: [
                      Container(
                        color: AppColor.backgroundPage,
                        child: Column(
                            children: List.generate(
                                provider.questionsDataList[index]['subtitle1']
                                    .length, (index) {
                          return ExpansionTile(
                              childrenPadding: EdgeInsets.all(15),
                              textColor: Color.fromRGBO(18, 96, 153, 1),
                              collapsedTextColor: Color.fromRGBO(0, 0, 0, 1),
                              title: Row(
                                children: [
                                  Flexible(
                                      child: Text(
                                          '${provider.questionsDataList[currentIndex]['subtitle1'][index].toString().split(',')[1]}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: AppFont.heavy))),
                                ],
                              ),
                              onExpansionChanged: (value) {
                                setState(() {
                                  //  _isExpanded = value;
                                });
                              },
                              leading: SizedBox(
                                width: 50,
                                child: AnimatedRotation(
                                   //turns: _iconTurns,
                                  turns: 0,
                                  duration: Duration(seconds: 1),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.expand_more,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              trailing: SizedBox(),
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Column(

                                          children: [
                                            Container(
                                              width: 2,
                                              height: 20,//double.infinity,
                                              color: Colors.grey,
                                              //decoration: BoxDecoration( border: Border.all(width: 2,color: Colors.grey)),
                                            ),
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(width: 2,color: Colors.grey)),
                                            ),
                                            Container(
                                              width: 2,
                                              height: 20,//double.infinity,
                                              color: Colors.grey,
                                              //decoration: BoxDecoration( border: Border.all(width: 2,color: Colors.grey)),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 10,
                                          height: 2,//double.infinity,
                                          color: Colors.grey,
                                          //decoration: BoxDecoration( border: Border.all(width: 2,color: Colors.grey)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20,),
                                    Expanded(
                                      child: Text(
                                        '${provider.questionsDataList[currentIndex]['subtitle1'][index].toString().split(',')[3]}',
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color:
                                                Color.fromRGBO(43, 43, 43, 1),
                                            fontFamily: AppFont.heavy),
                                      ),
                                    ),
                                  ],
                                )
                              ]);
                        })),
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
}

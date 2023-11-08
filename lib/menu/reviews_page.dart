import 'package:clean_whale/utils/style.dart';
import 'package:clean_whale/widgets/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../menu.dart';

class ReviewsInfo extends StatefulWidget {
  const ReviewsInfo({Key? key}) : super(key: key);

  @override
  State<ReviewsInfo> createState() => _ReviewsInfoState();
}

class _ReviewsInfoState extends State<ReviewsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPage  ,
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
              const Text('Відгуки про компанію «CleanWhale»',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.primaryTitleInfoPages),
              const SizedBox(
                height: 34,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(72, 105, 173, 1),
                        borderRadius: BorderRadius.circular(
                            AppValues.regularCornerRadius)),
                    child: Column(
                      children: const [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Facebook',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Середня оцінка в Facebook',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '4.8',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    height: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(66, 133, 244, 1),
                        borderRadius: BorderRadius.circular(
                            AppValues.regularCornerRadius)),
                    child: Column(
                      children: const [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Google',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Середня оцінка в Google',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '4.6',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: 65,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text('Відгуки наших клієнтів клієнтів',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.primarySubtitleInfoPages),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              _reviewsList(),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(72, 105, 173, 1),
                        borderRadius: BorderRadius.circular(
                            AppValues.regularCornerRadius)),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Залишити відгук в',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Facebook',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(66, 133, 244, 1),
                        borderRadius: BorderRadius.circular(
                            AppValues.regularCornerRadius)),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Залишити відгук в',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Google',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('Жива служба підтримки',
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                      fontSize: 20,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(14, 146, 71, 1))),
              const SizedBox(
                height: 27,
              ),
              Row(
                children:   const [
                  Flexible(
                    child: MessengerButton(
                      title: 'telegram',
                      uriPic: 'lib/assets/icons/telegram.svg',
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: MessengerButton(
                      title: 'messenger',
                      uriPic: 'lib/assets/icons/messenger.svg',
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: MessengerButton(
                      title: 'whatsapp',
                      uriPic: 'lib/assets/icons/whatsapp.svg',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Text('Ніяких роботів і автоматичних відповідей - задайте питання і отримаєте швидку відповідь від людини',
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                      fontSize: 16,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(73, 85, 109, 1))),
              const SizedBox(
                height: 47,
              ),
              const Text('*Це реальні відгуки на публічних сервісах. Ми не можемо їх коригувати та видаляти.',
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                      fontSize: 16,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(73, 85, 109, 1))),
                const SizedBox(
                height: 75,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:   CustomBottomBar(2),
    );
  }

  Widget _reviewsList() {
    return Consumer<InfoProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: provider.reviewsDataList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                              '${provider.reviewsDataList[index]['author']}',
                              style: AppTextStyle.authorComment)),
                    ],
                  ),
                  const SizedBox(
                    height: 8.5,
                  ),
                  Row(
                      children: List.generate(
                          provider.reviewsDataList[index]['star'],
                          (index) =>
                              SvgPicture.asset('lib/assets/icons/star 5.svg'))),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(240, 224, 173, 1),
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                        '${provider.reviewsDataList[index]['description']}',style: AppTextStyle.comment),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

}

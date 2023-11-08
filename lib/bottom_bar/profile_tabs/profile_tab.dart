import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/profile_provider.dart';
import '../../services/navigation_service/navigation_service.dart';
import '../../utils/style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'add_adress_page.dart';
import 'edit_order_page.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text('Привіт, Юлія',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        fontFamily: AppFont.heavy,
                        color: Color.fromRGBO(43, 43, 43, 1))),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            _newsSection(),
            const SizedBox(
              height: 50,
            ),
            _yourNextOrder(),
            const SizedBox(
              height: 35,
            ),
            CustomElevatedButton(
              context: context,
              uriPic: 'lib/assets/icons/settings 1.svg',
              title: 'Редагувати обліковий запис',
              bgColor: Color.fromRGBO(247, 247, 247, 1),
              onTap: () {
                NavigationService().push(context,const EditOrderPage());
              },
            ),
            const SizedBox(
              height: 12,
            ),
            CustomElevatedButton(
              context: context,
              uriPic: 'lib/assets/icons/logout 1.svg',
              title: 'Вийти з облікового запису',
              bgColor: Color.fromRGBO(253, 227, 228, 1),
              onTap: () {

              },
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _newsSection() {
    return Column(
      children: [
        Row(
          children: const [
            Flexible(
              child: Text('Новини та важливі повідомлення',
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
        Consumer<ProfileProvider>(
          builder: (context, provider, child) {
            return CarouselSlider.builder(
              itemCount: provider.listNews.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(89, 183, 139, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: ListTile(
                      leading: SvgPicture.asset(
                        provider.listNews[itemIndex]['uriPicture'],
                        width: 62,
                      ),
                      title: Text('${provider.listNews[itemIndex]['title']}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: AppFont.heavy,
                              color: Color.fromRGBO(43, 43, 43, 1))),
                      subtitle: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 9.0),
                          child: Text('${provider.listNews[itemIndex]['text']}',
                              //textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  fontFamily: AppFont.heavy,
                                  color: Color.fromRGBO(43, 43, 43, 1))),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              options: CarouselOptions(
                aspectRatio: 2.0,
              ),
            );
          },
        )
      ],
    );
  }

  Widget _yourNextOrder() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Flexible(
              child: Text('Ваше наступне замовлення',
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
                  Flexible(
                    child: const Text('Ваше наступне замовлення',
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

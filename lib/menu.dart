import 'package:clean_whale/home_page.dart';
import 'package:clean_whale/utils/style.dart';
import 'package:clean_whale/widgets/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'services/navigation_service/navigation_service.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundPage,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [Container()],
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'lib/assets/icons/clean_whale.svg',
              height: 35,
            ),
            const Spacer(),
            Builder(
              builder: (context) => InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: Color.fromRGBO(179, 179, 179, 1),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
            decoration: const BoxDecoration(
              color: AppColor.backgroundPage,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _listLanguages(provider),
                  const Divider(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text('Вибір послуг'.toUpperCase(),
                          style: AppTextStyle.titlePrimary,
                          textAlign: TextAlign.center),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  _tabs(provider),
                  const Divider(
                    height: 70,
                  ),
                  _infoListSection(),
                  const Divider(
                    height: 55,
                  ),
                  _countriesSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _listLanguages(HomeProvider provider) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: provider.languages.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              provider.selectedLangIndex = index;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.5),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                decoration: BoxDecoration(
                    color: provider.selectedLangIndex == index
                        ? const Color.fromRGBO(221, 221, 221, 1)
                        : const Color.fromRGBO(248, 248, 248, 1),
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                    child: Text(
                  provider.languages[index],
                  style: const TextStyle(
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                )),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _tabs(HomeProvider provider) {
    return SizedBox(
      height: 73,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: provider.tabList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              provider.selectedTabIndex = index;
                Navigator.pop(context);
              NavigationService().push(context,const CreateOrderTab( ));

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.5),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                decoration: BoxDecoration(
                    color: provider.selectedTabIndex == index
                        ? AppColor.tabSelectedBackgroundColor
                        : const Color.fromRGBO(248, 248, 248, 1),
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                    child: Container(
                  //color: AppColor.tabUnSelectedLabelColor,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 9.43,
                      ),
                      SvgPicture.asset(
                        provider.tabList[index]['uri']!,
                        height: 30,
                      ),
                      const SizedBox(
                        height: 9.43,
                      ),
                      Expanded(
                        child: Text(
                          provider.tabList[index]['title']!,
                          style: AppTextStyle.labelTab,
                        ),
                      ),
                      const SizedBox(
                        height: 9.43,
                      ),
                    ],
                  ),
                )),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _infoListSection() {
    return Column(
      children: [
        Row(
          children: [
            Text('Інформація'.toUpperCase(),
                style: AppTextStyle.titlePrimary, textAlign: TextAlign.center),
          ],
        ),
        const SizedBox(
          height: 11,
        ),
        _infoItem('Про нас', 1),
        _infoItem('Ціни та прибирання', 2),
        _infoItem('Що входить у прибирання', 3),
        _infoItem('Відгуки', 4),
        _infoItem('Абонемент на прибирання', 5),
        _infoItem('Запитання та відповіді', 6),
        _infoItem('Знижки та пропозиції', 7),
        _infoItem('Подарувати прибирання', 8),
      ],
    );
  }

  Widget _countriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Польща'.toUpperCase(),
              style: AppTextStyle.titleBlackBig,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            _countryItem('Варшава'),
            _countryItem('Краків'),
            _countryItem('Вроцлав'),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              'Україна'.toUpperCase(),
              style: AppTextStyle.titleBlackBig,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            _countryItem('Київ'),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              'Латвія'.toUpperCase(),
              style: AppTextStyle.titleBlackBig,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            _countryItem('Рига'),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              'Німечинна'.toUpperCase(),
              style: AppTextStyle.titleBlackBig,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            _countryItem('Берлін'),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              'Білорусь'.toUpperCase(),
              style: AppTextStyle.titleBlackBig,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            _countryItem('Мінськ'),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              'Чехія'.toUpperCase(),
              style: AppTextStyle.titleBlackBig,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            _countryItem('Прага'),
          ],
        ),
      ],
    );
  }

  Widget _countryItem(String title) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(248, 248, 248, 1),
              borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontFamily: AppFont.heavy,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color.fromRGBO(0, 0, 0, 1)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoItem(String title, int index) {
    return
      Material(
        child: Ink(
          decoration:   BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.regularCornerRadius),
            color: AppColor.backgroundPage,
          ),
          child: InkWell(

          onTap: () {
            switch (index) {
              case 1:
                NavigationService().push(context, const AboutUs());
                break;
              case 2:
                NavigationService().push(context, const Prices());
                break;
              case 3:
                NavigationService().push(context, const CleanerParts());
                break;
              case 4:
                NavigationService().push(context, const ReviewsInfo());
                break;
              case 5:
                NavigationService().push(context, const Abonement());
                break;
              case 6:
                NavigationService().push(context, const QuestionsAnswers());
                break;
              case 7:
                NavigationService().push(context, const PresentPage());
                break;
            }
          },
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 40, right: 16),
                decoration:   BoxDecoration(
                  borderRadius: BorderRadius.circular(AppValues.regularCornerRadius),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          title,
                          style: index == 7
                              ? const TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFont.heavy,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(252, 105, 69, 1))
                              : AppTextStyle.drawerInfoList,
                        ),
                      ),
                    ),
                    SvgPicture.asset('lib/assets/icons/Arrow 1.svg')
                  ],
                ),
              ),
              if (index == 8) SvgPicture.asset('lib/assets/icons/gift 1.svg')
            ],
          ),
    ),
        ),
      );
  }
}

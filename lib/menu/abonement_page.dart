import 'package:clean_whale/utils/style.dart';
import 'package:clean_whale/widgets/all.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../menu.dart';
import '../widgets/info/discount.dart';
import '../widgets/info/flat_price.dart';

class Abonement extends StatefulWidget {
  const Abonement({Key? key}) : super(key: key);

  @override
  State<Abonement> createState() => _AbonementState();
}

class _AbonementState extends State<Abonement> {
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
                height: 58,
              ),
              const Text(
                  'Передплата зручний інструмент для регулярного прибирання у вашій квартирі',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.primaryTitleInfoPages),
              const SizedBox(
                height: 11,
              ),
              const Text(
                  'Виберіть періодичність прибирання, щоб подивитися ціну з урахуванням знижки',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.secondaryTitleInfoPages),
              const SizedBox(
                height: 18,
              ),
              _discountSection(context),
              _tableSection(),
              const SizedBox(
                height: 70,
              ),
              _abonementOptionsSection(),
              const SizedBox(
                height: 70,
              ),
              Image.asset('lib/assets/icons/subscribe-order 1.png'),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                  enabledColor: const Color.fromRGBO(89, 183, 139, 1),
                  text: 'Оформити передплату на прибирання',
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                  onTap: () {}),
            ],
          ),
        ),
      ),
      bottomNavigationBar:   CustomBottomBar(2),
    );
  }

  Widget _discountSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<InfoProvider>(
            builder: (context, provider, child) {
              return CustomGridView(
                padding: const EdgeInsets.only(top: 0),

                listWidget: List.generate(
                    provider.discountDataList.length,
                    (index) => InkWell(
                          onTap: () {
                            provider.selectedDiscountId =
                                provider.discountDataList[index]['id'];
                          },
                          child: DiscountInfo(
                            percent: provider.discountDataList[index]
                                    .containsKey('percent')
                                ? CellSmall(
                                    provider.discountDataList[index]['percent'])
                                : const SizedBox(
                                    height: 0.0,
                                    width: 0.0,
                                  ),
                            title: provider.discountDataList[index]['title'],
                            textColor: provider.selectedDiscountId ==
                                    provider.discountDataList[index]['id']
                                ? Colors.white
                                : Colors.black,
                            backgroundColor: provider.selectedDiscountId ==
                                    provider.discountDataList[index]['id']
                                ? AppColor.primary
                                : AppColor.backgroundGridViewItem,
                          ),
                        )),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _tableSection() {
    return Column(
      children: const [
        FlatPrice(
            title: 'Однокімнатна',
            subTitle: '3-х годинне прибирання',
            price: '119.92 zł',
            description:
                'У вартість входить прибирання однієї кімнати, кухні, передпокою та одного санвузла раз на тиждень',
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            showClock: false,
            borderColor: Colors.transparent,
            elevation: 10),
        SizedBox(
          height: 35,
        ),
        FlatPrice(
            title: 'Двокімнатна',
            subTitle: '4-х годинне прибирання',
            price: '143.92 zł',
            description:
                'У вартість входить прибирання двох кімнат, кухні, передпокою та одного санвузла раз на тиждень',
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            showClock: false,
            borderColor: Colors.transparent,
            elevation: 10),
        SizedBox(
          height: 35,
        ),
        FlatPrice(
            title: 'Трикімнатна',
            subTitle: '5-и годинне прибирання',
            price: '167.92 zł',
            description:
                'У вартість входить прибирання трьох кімнат, кухні, передпокою та одного санвузла раз на тиждень',
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            showClock: false,
            borderColor: Colors.transparent,
            elevation: 10),
      ],
    );
  }

  Widget _abonementOptionsSection() {
    return Column(
      children: [
        Consumer<InfoProvider>(
          builder: (context, provider, child) {
            return CustomGridView(
              padding: const EdgeInsets.only(top: 10),
              crossAxisCount: 1,

              listWidget: provider.abonementOptionsList(),
              onTap: (index) {},
            );
          },
        ),
      ],
    );
  }

  Widget _chapterItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 5,
          height: 5,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(100)),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(text, style: AppTextStyle.secondaryTitleInfoPages),
        )
      ],
    );
  }
}

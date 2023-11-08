import 'package:clean_whale/utils/style.dart';
import 'package:clean_whale/widgets/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../menu.dart';
import '../widgets/info/discount.dart';
import '../widgets/info/flat_price.dart';

class Prices extends StatelessWidget {
  const Prices({Key? key}) : super(key: key);

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
              const Text('Ціни на наші послуги',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.primaryTitleInfoPages),
              const SizedBox(
                height: 35,
              ),
              const Text('Скільки це коштує?',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.primarySubtitleInfoPages),
              const SizedBox(
                height: 18,
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
                height: 50,
              ),
              _cleanerOptionsSection(),
              const Divider(
                height: 70,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text('Ціна на хімчистку в Києві',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.primaryTitleInfoPages),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              _dryCleanerSection(),
              const Divider(
                height: 70,
              ),
              SvgPicture.asset('lib/assets/icons/renovation 1.svg'),
              const SizedBox(
                height: 20,
              ),
              _chaptersList(),
              const SizedBox(
                height: 40,
              ),
              _cleanerFlat(),
              const Divider(
                height: 70,
              ),
              SvgPicture.asset('lib/assets/icons/windows (1) 1.svg'),
              const SizedBox(
                height: 27,
              ),
              _cleanWindowsPricesSection(),

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
        ),
        SizedBox(
          height: 35,
        ),
        FlatPrice(
          title: 'Двокімнатна',
          subTitle: '4-х годинне прибирання',
          price: '143.92 zł',
          description:
              'У вартість входить прибирання двох кімнат, кухні, передпокою та одного санвузла раз на тиждень',
        ),
        SizedBox(
          height: 35,
        ),
        FlatPrice(
          title: 'Трикімнатна',
          subTitle: '5-и годинне прибирання',
          price: '167.92 zł',
          description:
              'У вартість входить прибирання трьох кімнат, кухні, передпокою та одного санвузла раз на тиждень',
        ),
        SizedBox(
          height: 35,
        ),
      ],
    );
  }

  Widget _cleanerOptionsSection() {
    return Column(
      children: [
        Consumer<InfoProvider>(
          builder: (context, provider, child) {
            return CustomGridView(
              padding: const EdgeInsets.only(top: 10),

              listWidget: provider.cleanerOptionsList(),
              onTap: (index) {},
            );
          },
        ),
        const SizedBox(
          height: 50,
        ),
        CustomButton(text: 'Замовити прибирання квартири', onTap: () {})
      ],
    );
  }

  Widget _dryCleanerSection() {
    return Column(
      children: [
        Consumer<InfoProvider>(
          builder: (context, provider, child) {
            return CustomGridView(
              padding: const EdgeInsets.only(top: 10),

              listWidget: provider.dryCleanerList(),
              onTap: (index) {},
            );
          },
        ),
        const SizedBox(
          height: 50,
        ),
        CustomButton(text: 'Замовити хімчистку меблів та килимів', onTap: () {})
      ],
    );
  }

  Widget _cleanerFlat() {
    return Consumer<InfoProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            CustomGridView(
              padding: const EdgeInsets.only(top: 10),

              listWidget: provider.flatCleanerOptionsList(),
              onTap: (index) {},
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
                text: 'Оформити замовлення на прибирання після ремонту',
                onTap: () {})
          ],
        );
      },
    );
  }

  Widget _chaptersList() {
    return Column(children: [
      Row(
        children: const [
          Expanded(
            child: Text('Ціна на прибирання після ремонту в Києві',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: AppFont.heavy,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(43, 43, 43, 1))),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      RichText(
        text: const TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Якісно та швидко',
              style: TextStyle(
                backgroundColor: Color.fromRGBO(93, 182, 140, 1),
                fontSize: 15,
                fontFamily: AppFont.heavy,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            TextSpan(
                text:
                    ' виконуємо прибирання, після завершення ремонту у вашій квартирі',
                style: AppTextStyle.secondaryTitleInfoPages),
          ],
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      _chapterItem(
          'Повноцінне остаточне прибирання після будівництва чи ремонту'),
      const SizedBox(
        height: 5,
      ),
      _chapterItem('Ви повертаєтеся в чисту квартиру, де можна починати жити'),
      const SizedBox(
        height: 5,
      ),
      _chapterItem('У нас фіксовані ціни '),
      const SizedBox(
        height: 5,
      ),
      _chapterItem('Ми зробимо прибирання протягом одного дня'),
      const SizedBox(
        height: 5,
      ),
      const SizedBox(
        height: 5,
      ),
      _chapterItem(
          'У нас професійна техніка, весь необхідний інвентар і досвідчена команда'),
    ]);
  }

  Widget _cleanWindowsPricesSection(){
    return Column(
      children: [
        Row(
          children: const [
            Flexible(
              child: Text('Ціни на миття вікон ',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.primaryTitleInfoPages),
            ),
          ],
        ),
        Consumer<InfoProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                CustomGridView(
                  padding: const EdgeInsets.only(top: 10),

                  listWidget: provider.windowsCleanerOptionsList(),
                  onTap: (index) {},
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                    text: 'Замовити мийку вікон',
                    onTap: () {})
              ],
            );
          },
        )
      ],
    );
  }



  Widget _chapterItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
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

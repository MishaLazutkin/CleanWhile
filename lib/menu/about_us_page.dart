import 'package:clean_whale/utils/style.dart';
import 'package:clean_whale/widgets/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../menu.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPage,
      appBar: CustomHeader(),
      endDrawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 58,),
                  const Text(  'Ми клінінгова компанія і наша мета — ',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.primaryTitleInfoPages),
                  const Text(  'зробити ваше життя простішим',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 25,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(36, 87, 198, 1))),
                  const SizedBox(height: 18,),
                  const Text(  '«CleanWhale» працює в Україні, Білорусі та Латвії. Перший офіс відкрився в Мінську у 2016 році.'
                  'Ми займаємося прибиранням квартир та офісів, прибиранням після ремонту, хімчисткою меблів,'
                  'а також обслуговуємо масові заходи.',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.secondaryTitleInfoPages),
                  const SizedBox(height: 37,),
                  _tableSection(),
                  const SizedBox(height: 50,),
                  SvgPicture.asset('lib/assets/icons/clients 1.svg'),
                  const SizedBox(height: 20,),
                  const Text(  'Понад 1000 задоволених клієнтів щомісяця',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: AppFont.heavy,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(0, 0, 0, 1))),
                  const SizedBox(height: 50,),
                  _makeFirstOrder()

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:   CustomBottomBar(2),
    );
  }

  Widget _tableSection() {
    return Consumer<InfoProvider>(
      builder: (context, provider, child) {
        return CustomGridView(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.only(top: 10),
          crossAxisCount: 2,

          listWidget: provider.aboutUsTableList(),
          onTap: (index) {},
        );
      },
    );
  }

  Widget _makeFirstOrder() {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 25),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              'lib/assets/icons/first_order.svg',
              width: 62,
            ),
            const SizedBox(height: 20,),
            const Text('Зробити перше замовлення',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontFamily: AppFont.heavy,
                    color: Color.fromRGBO(255, 255, 255, 1))),
            const SizedBox(height: 10,),
        const Text('Промокод start — знижка 15% на перше замовлення',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                fontFamily: AppFont.heavy,
                color: Color.fromRGBO(255, 255, 255, 1))),




          ],
        ),
      ),
    );
  }
}

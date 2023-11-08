
import 'package:clean_whale/services/navigation_service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/style.dart';
import '../menu.dart';
import '../widgets/custom_bottom_bar.dart';
import '../widgets/header.dart';
import 'profile_tabs/referral_program_page.dart';

class BonusesTab extends StatefulWidget {
  const BonusesTab({Key? key}) : super(key: key);

  @override
  State<BonusesTab> createState() => _BonusesTabState();
}

class _BonusesTabState extends State<BonusesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPage,
      appBar: CustomHeader(),
      endDrawer: DrawerMenu(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: AppValues.headerMarginTop,
              ),
              _title(),
              const SizedBox(
                height: 50,
              ),
              _yourBonus(),
              const SizedBox(
                height: 13,
              ),
              _label(),
              const SizedBox(
                height: 37,
              ),
              _payRules(),
              const SizedBox(
                height: 58,
              ),
              _referralSection(),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:   CustomBottomBar(1),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Мої бонуси',
          style: AppTextStyle.titleBlackBig,
        )
      ],
    );
  }

  Widget _yourBonus() {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(89, 183, 139, 1),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 10),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'lib/assets/icons/pouch 1.svg',
                width: 35,
              ),
              const SizedBox(width: 20,),
              const Text('Бонуси 0 zl ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(43, 43, 43, 1))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label() {
    return InkWell(
      onTap: () {
        NavigationService().push(context, const RefferalProgram());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('lib/assets/icons/info 1.svg'),
          const SizedBox(
            width: 10,
          ),
          const Text('Як я можу їх витратити?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: AppFont.heavy,
                  color: Color.fromRGBO(64, 64, 64, 1))),
        ],
      ),
    );
  }

  Widget _payRules() {
    return Column(
      children: [
        Row(
          children: [
            _circle('1'),
            const SizedBox(
              width: 18,
            ),
            const Flexible(
              child: Text('Надіслати код знайомому або знайомому',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(43, 43, 43, 1))),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            _circle('2'),
            const SizedBox(
              width: 18,
            ),
            const Flexible(
              child: Text('Твій знайомий робить своє перше замовлення',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(43, 43, 43, 1))),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            _circle('3'),
            const SizedBox(
              width: 18,
            ),
            const Flexible(
              child: Text('Ви отримуєте по 45 zł',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(43, 43, 43, 1))),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget _referralSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 28),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(232, 244, 179, 1),
          borderRadius: BorderRadius.circular(AppValues.regularCornerRadius)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Flexible(
                child: Text('Ваше реферальне посилання',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFont.heavy,
                        color: Colors.black)),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 5),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(224, 235, 174, 1),
                borderRadius:
                    BorderRadius.circular(AppValues.regularCornerRadius)),
            child: const Text('https://cleanwhale.pl/referral/iG80u0XH',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    fontFamily: AppFont.heavy,
                    color: Colors.black)),
          ),
          const SizedBox(
            height: 36,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Flexible(
                child: Text(
                    'Send it to your friends and get 45 zł for each order from your referral link',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFont.heavy,
                        color: Colors.black)),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _circleMessenger('lib/assets/icons/telegram_light.svg')),
              const SizedBox(
                width: 18,
              ),
              Expanded(child: _circleMessenger('lib/assets/icons/viber_light.svg')),
              const SizedBox(
                width: 18,
              ),
              Expanded(child: _circleMessenger('lib/assets/icons/messenger_light.svg')),
              const SizedBox(
                width: 18,
              ),
              Expanded(child: _circleMessenger('lib/assets/icons/phone_light.svg')),
            ],
          )
        ],
      ),
    );
  }

  Widget _circle(String text) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              color: AppColor.cell, borderRadius: BorderRadius.circular(100)
              //more than 50% of width makes circle
              ),
        ),
        Text(text,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: AppFont.heavy,
                color: Colors.black))
      ],
    );
  }

  Widget _circleMessenger(String picture) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(89, 183, 139, 1),
              borderRadius: BorderRadius.circular(100)),
        ),
        SvgPicture.asset(picture),
      ],
    );
  }
}

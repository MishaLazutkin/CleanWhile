import 'package:clean_whale/widgets/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/style.dart';
class RefferalProgram extends StatefulWidget {
  const RefferalProgram({Key? key}) : super(key: key);

  @override
  State<RefferalProgram> createState() => _RefferalProgramState();
}

class _RefferalProgramState extends State<RefferalProgram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      endDrawer:const DrawerMenu(
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 50,
              ),
              _title(),
              const SizedBox(
                height: 40,
              ),
              SvgPicture.asset('lib/assets/icons/Page-1.svg'),
              const SizedBox(
                height: 40,
              ),
              _title2(),
              _title3(),
              const SizedBox(
                height: 13,
              ),
              _textGetBonus(),
              const SizedBox(
                height: 40,
              ),
              _howItWorksSection()
            ],
          ),
        ),
      ),
      bottomNavigationBar:   CustomBottomBar( 4),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            'Реферальна програма'.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20,
                fontFamily: AppFont.heavy,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(43, 43, 43, 1)),
          ),
        ),
      ],
    );
  }

  Widget _title2() {
    return Text(
      'Запрошення'.toUpperCase(),
      style: const TextStyle(
          fontSize: 20,
          fontFamily: AppFont.heavy,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(36, 87, 198, 1)),
    );
  }

  Widget _title3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            'Отримайте бонусні бали'.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20,
                fontFamily: AppFont.heavy,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(28, 71, 166, 1)),
          ),
        ),
      ],
    );
  }

  Widget _textGetBonus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Flexible(
          child: Text(
            'Надішліть ваш особистий реферальний код. Це можна зробити за допомогою посилань на соцмережі або месенджери внизу або просто скопіювавши код. Після того, як за цим кодом буде зроблено замовлення, ви та новий клієнт отримаєте кожен по 45 zł на особистий рахунок. Ці гроші можна буде використовувати для часткової або повної оплати прибирань на нашому сайті.'
            'Щоб використовувати накопичені кошти, замовлення необхідно буде зробити з особистого кабінету.',
            style: TextStyle(
                fontSize: 17,
                fontFamily: AppFont.heavy,
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(43, 43, 43, 1)),
          ),
        ),
      ],
    );
  }

  Widget _howItWorksSection() {
    return Column(
      children: [
        const Text(
          'Як це працює?',
          style: TextStyle(
              fontSize: 19,
              fontFamily: AppFont.heavy,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(43, 43, 43, 1)),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _circle('1'),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: SvgPicture.asset('lib/assets/icons/path.svg'),
            ),
            const SizedBox(
              width: 10,
            ),
            const Flexible(
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Зареєструйте акаунт',
                  style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(36, 87, 198, 1)),
                ),
                subtitle: Text(
                  'Для цього достатньо вказати номер телефону',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _circle('2'),
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset('lib/assets/icons/path.svg'),
            const SizedBox(
              width: 10,
            ),
            const Flexible(
              child: Text(
                'Надішліть свій особистий код друзям',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: AppFont.heavy,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _circle('3'),
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset('lib/assets/icons/path.svg'),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Ваш друг оформлює замовлення',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                subtitle: Text(
                  'Ваш друг має мати акаунт і це має бути його перше замовлення',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _circle('4'),
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset('lib/assets/icons/path.svg'),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Ви отримуєте по 45 zł',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                subtitle: Text(
                  'Ними можна оплатити замовлення повністю або частково',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        _referralSection()
      ],
    );
  }

  Widget _referralSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 28),
      decoration: BoxDecoration(
          color:   AppColor.primary,
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
                        color: Color.fromRGBO(255, 255, 255, 1))),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 5),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 0.33),
                borderRadius:
                BorderRadius.circular(AppValues.regularCornerRadius)),
            child: const Text('https://cleanwhale.pl/referral/iG80u0XH',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    fontFamily: AppFont.heavy,
                    color: Color.fromRGBO(255, 255, 255, 1))),
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
                        color: Color.fromRGBO(255, 255, 255, 1))),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('lib/assets/icons/share (1) 1.svg',width: 60,),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: _circleMessenger('lib/assets/icons/telegram_light.svg')),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: _circleMessenger('lib/assets/icons/viber_light.svg')),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: _circleMessenger('lib/assets/icons/messenger_light.svg')),
              const SizedBox(
                width: 10,
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
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: AppColor.primary, borderRadius: BorderRadius.circular(100)
              //more than 50% of width makes circle
              ),
        ),
        Text(text,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: AppFont.heavy,
                color: Colors.white))
      ],
    );
  }


  Widget _circleMessenger(String picture) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.33),
              borderRadius: BorderRadius.circular(100)),
        ),
        SvgPicture.asset(picture),
      ],
    );
  }
}

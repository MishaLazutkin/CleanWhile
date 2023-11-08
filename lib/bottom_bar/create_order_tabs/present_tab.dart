import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../utils/style.dart';
import '../../widgets/all.dart';
import '../../widgets/select_phone.dart';

class PresentTab extends StatefulWidget {
  const PresentTab({Key? key}) : super(key: key);

  @override
  State<PresentTab> createState() => _PresentTabState();
}

class _PresentTabState extends State<PresentTab>
    with FullscreenLoaderMixin<PresentTab> {
  final TextEditingController _certEmail = TextEditingController();
  final TextEditingController _certPhone = TextEditingController();
  final TextEditingController _additionalInfo = TextEditingController();
  final TextEditingController _yourEmail = TextEditingController();
  final TextEditingController _yourPhone = TextEditingController();
  final TextEditingController _cash = TextEditingController();

  final FocusNode _certEmailNode = FocusNode();
  final FocusNode _certPhoneNode = FocusNode();
  final FocusNode _additionalInfoNode = FocusNode();
  final FocusNode _yourEmailNode = FocusNode();
  final FocusNode _yourPhoneNode = FocusNode();
  final FocusNode _cashNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initProvider();
  }

  _initProvider() async {
    PresentProvider presentProvider = context.read<PresentProvider>();
    runWithLoader(() async {
      await presentProvider.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Container(
            color: AppColor.primary,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 35,
                ),
                _title1(),
                const SizedBox(
                  height: 22,
                ),
                _title2(),
                const SizedBox(
                  height: 18,
                ),
                _howItWorksSection(),
                const SizedBox(
                  height: 50,
                ),
                _restrictions(),
                const SizedBox(
                  height: 50,
                ),
                _sendMessageSection(),
                const SizedBox(
                  height: 70,
                ),
                _chooseCertificateSection(),
                const SizedBox(
                  height: 50,
                ),
                _chooseAmount(),
                const SizedBox(
                  height: 60,
                ),
                _formDataSection(),
                const SizedBox(
                  height: 50,
                ),
                _paySection(),
                const SizedBox(
                  height: 46,
                ),
                _bottomButton(),
                const SizedBox(
                  height: 38,
                ),
                _bottomText(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _title1() {
    return const Text('Подарункові сертифікати на прибирання квартири',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            fontFamily: AppFont.heavy,
            color: Color.fromRGBO(255, 255, 255, 1)));
  }

  Widget _title2() {
    return const Text('Прибирання - це завжди хороший подарунок 😉',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            fontFamily: AppFont.heavy,
            color: Color.fromRGBO(252, 213, 40, 1)));
  }

  Widget _restrictions() {
    return DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(50),
        dashPattern: const [6, 6],
        color: const Color.fromRGBO(240, 240, 240, 1),
        // radius:  Radius.circular(50),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 16),
            child: const Text('Не існує обмежень щодо терміну дії промо-коду',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFont.heavy,
                    color: Color.fromRGBO(255, 255, 255, 1))),
          ),
        ));
  }

  Widget _sendMessageSection() {
    return Column(
      children: [
        const Text(
            'Якщо вам потрібен сертифікат на індивідуальне прибирання, хімчистку чи прибирання після ремонту, напишіть нам',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: AppFont.heavy,
                color: Color.fromRGBO(218, 218, 218, 1))),
        const SizedBox(
          height: 22,
        ),
        Row(
          children: const [
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
        )
      ],
    );
  }

  Widget _howItWorksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Як це працює?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                fontFamily: AppFont.heavy,
                color: Color.fromRGBO(255, 255, 255, 1))),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                      //more than 50% of width makes circle
                      ),
                ),
                const Text('1',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFont.heavy,
                        color: AppColor.primary))
              ],
            ),
            const SizedBox(
              width: 18,
            ),
            const Flexible(
              child: Text('Виберіть суму',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(255, 255, 255, 1))),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                      //more than 50% of width makes circle
                      ),
                ),
                const Text('2',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFont.heavy,
                        color: AppColor.primary))
              ],
            ),
            const SizedBox(
              width: 18,
            ),
            const Flexible(
              child: Text(
                  'Введіть адресу електронної пошти та / або номер особи, якій призначений подарунок',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(255, 255, 255, 1))),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                      //more than 50% of width makes circle
                      ),
                ),
                const Text('3',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFont.heavy,
                        color: AppColor.primary))
              ],
            ),
            const SizedBox(
              width: 18,
            ),
            const Flexible(
              child: Text('Оплачуйте все через Інтернет',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(255, 255, 255, 1))),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                      //more than 50% of width makes circle
                      ),
                ),
                const Text('4',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFont.heavy,
                        color: AppColor.primary))
              ],
            ),
            const SizedBox(
              width: 18,
            ),
            const Flexible(
              child: Text(
                  'Людина отримує унікальний код і може застосувати його на нашому веб-сайті та повністю або частково оплатити послугу',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(255, 255, 255, 1))),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                      //more than 50% of width makes circle
                      ),
                ),
                const Text('5',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFont.heavy,
                        color: AppColor.primary))
              ],
            ),
            const SizedBox(
              width: 18,
            ),
            const Flexible(
              child: Text(
                  'Лист і смс містять усі вказівки, а також можуть бути дані про відправника подарунка',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(255, 255, 255, 1))),
            ),
          ],
        ),
      ],
    );
  }

  Widget _chooseCertificateSection() {
    return Column(
      children: [
        const Text('Оберіть потрібний сертифікат',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                fontFamily: AppFont.heavy,
                color: Color.fromRGBO(255, 255, 255, 1))),
        const SizedBox(
          height: 25,
        ),
        Consumer<PresentProvider>(
          builder: (context, provider, child) {
            return CustomGridView(
              padding: const EdgeInsets.only(top: 10),

              listWidget: provider.presentOptionsList(),
              onTap: (index) {
                provider.selectedCertificateId =
                    provider.presentDataList[index]['id'];
              },
            );
          },
        )
      ],
    );
  }

  Widget _chooseAmount() {
    return Consumer<PresentProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            const Text('або самі вкажіть суму',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFont.heavy,
                    color: Color.fromRGBO(255, 255, 255, 1))),
            const SizedBox(
              height: 17,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: AppColor.presentUnSelected,
                  borderRadius:
                      BorderRadius.circular(AppValues.regularCornerRadius)),
              child: Column(
                children: [
                  const Text('Хочу зробити подарунок на',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFont.heavy,
                          color: Color.fromRGBO(43, 43, 43, 1))),
                  const SizedBox(
                    height: 13,
                  ),
                  SizedBox(
                      child: Row(
                    children: [
                      Flexible(
                        child: CustomTextField(
                          controller: _cash,
                          focusNode: _cashNode,
                          fillColor: AppColor.presentUnSelected,
                          focusedBorderColor:
                              const Color.fromRGBO(119, 119, 119, 0.3),
                          enabledBorderColor:
                              const Color.fromRGBO(119, 119, 119, 0.3),
                          keyboardType: TextInputType.number,
                          onTyping: (x) {
                            provider.cashPresent = double.parse(_cash.text);
                          },
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 17,
                  ),
                  const Text('PLN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFont.heavy,
                          color: Color.fromRGBO(43, 43, 43, 1))),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _formDataSection() {
    return Consumer<PresentProvider>(
  builder: (context, provider, child) {
  return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                      focusNode: _certEmailNode,
                      controller: _certEmail,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon:
                          SvgPicture.asset('lib/assets/icons/email 1.svg'),
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(
                          left: 60, top: 8, bottom: 8, right: 16),
                      labelText: 'Введіть email, куди надіслати сертифікат',
                      onTyping: (x) {

                        provider.emailCertificate=x;
                      }),
                ),
              ],
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
                focusNode: _certPhoneNode,
                controller: _certPhone,
                prefixIcon: const SelectPhone(),
                prefixPadding: 0.0,
                fillColor: Colors.white,
                keyboardType: TextInputType.phone,
                labelText: 'Номер телефону, на який відправити код',
                contentPadding: const EdgeInsets.only(
                    left: 120, top: 8, bottom: 8, right: 16),
                onTyping: (x) {
                  provider.phoneCertificate=x;
                }),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                focusNode: _additionalInfoNode,
                controller: _additionalInfo,
                textFieldHeight: 124,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                fillColor: Colors.white,
                prefixIcon: SvgPicture.asset('lib/assets/icons/text 1.svg'),
                prefixAlignment: Alignment.topLeft,
                contentPadding: const EdgeInsets.only(
                    left: 60, top: 8, bottom: 8, right: 16),
                labelText: 'Супровідний текст',
                onTyping: (x) {
                  provider.descriptionCertificate=x;
                }),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                      focusNode: _yourEmailNode,
                      controller: _yourEmail,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon:
                          SvgPicture.asset('lib/assets/icons/email 1.svg'),
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(
                          left: 60, top: 8, bottom: 8, right: 16),
                      labelText: 'Еmail адреса',
                      onTyping: (x) {
                        provider.yourEmail=x;
                      }),
                ),
              ],
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
                focusNode: _yourPhoneNode,
                controller: _yourPhone,
                prefixIcon: const SelectPhone(),
                prefixPadding: 0.0,
                fillColor: Colors.white,
                keyboardType: TextInputType.phone,
                labelText: 'Контактний телефон',
                contentPadding: const EdgeInsets.only(
                    left: 120, top: 8, bottom: 8, right: 16),
                onTyping: (x) {
                  provider.yourPhone=x;
                }),
          ],
        ),
      ),
    );
  },
);
  }

  Widget _paySection() {
    return Consumer<PresentProvider>(
  builder: (context, provider, child) {
  return Container(
      child: Column(
        children: [
          SvgPicture.asset(
            'lib/assets/icons/card (1) 1.svg',
            height: 62,
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Flexible(
                child: Text(
                  'Оплата карткою online',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 23,
          ),
          InkWell(
            onTap: (){provider.isCheckedContract= !provider.isCheckedContract;},
            child: Row(
              children: [
                SvgPicture.asset(
                  'lib/assets/icons/vector2.svg',
                  color:  provider.isCheckedContract? Color.fromRGBO(255, 255, 255, 1):Color.fromRGBO(189, 71, 64, 1),
                ),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: RichText(
                    text:   TextSpan(
                      children: [
                        TextSpan(
                          text: 'Погоджуюся з ',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppFont.heavy,
                              fontWeight: FontWeight.w500,
                              color:provider.isCheckedContract? Color.fromRGBO(255, 255, 255, 1):Color.fromRGBO(189, 71, 64, 1)),
                        ),
                        TextSpan(
                          text: 'публічним договором',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppFont.heavy,
                              fontWeight: FontWeight.w500,
                              color:provider.isCheckedContract? Color.fromRGBO(255, 255, 255, 1):Color.fromRGBO(189, 71, 64, 1),
                              decoration:
                                  TextDecoration.underline), //<-- SEE HERE
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  },
);
  }

  Widget _bottomButton() {
    return CustomButton(
      height: 72,
      enabledColor: const Color.fromRGBO(255, 234, 132, 1),
      text: 'Оформити подарунок',
      textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: AppFont.heavy,
          color: Color.fromRGBO(0, 0, 0, 1)),
      onTap: () {},
    );
  }

  Widget _bottomText() {
    return const Text(
      'Якщо ви хочете зробити сюрприз, залиште свою пошту та номер телефону, отримайте код особисто, а потім передайте його.',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontFamily: AppFont.heavy,
          color: Color.fromRGBO(255, 255, 255, 1)),
    );
  }
}

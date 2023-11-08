import 'package:clean_whale/widgets/persons_buttons.dart';
import 'package:clean_whale/widgets/title_primary.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../utils/app_helper.dart';
import '../../utils/style.dart';
import '../../widgets/all.dart';

class CarsTab extends StatefulWidget {
  const CarsTab({Key? key}) : super(key: key);

  @override
  State<CarsTab> createState() => _CarsTabState();
}

class _CarsTabState extends State<CarsTab> with FullscreenLoaderMixin<CarsTab> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _additionalInfo = TextEditingController();
  final TextEditingController _promocode = TextEditingController();
  final TextEditingController _refferal = TextEditingController();
  final TextEditingController _invoiceName = TextEditingController();
  final TextEditingController _invoiceNip = TextEditingController();
  final TextEditingController _invoiceAdress = TextEditingController();
  final TextEditingController _invoicePostalCode = TextEditingController();

  final FocusNode _invoiceNameNode = FocusNode();
  final FocusNode _invoiceNipNode = FocusNode();
  final FocusNode _invoiceAddressNode = FocusNode();
  final FocusNode _invoicePostalCodeNode = FocusNode();

  final FocusNode _nameNode = FocusNode();
  final FocusNode _phoneNumberNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode __additionalInfoNode = FocusNode();
  final FocusNode _promocodeNode = FocusNode();
  final FocusNode _refferalNode = FocusNode();

  var keyDate = GlobalKey();
  var keyTime = GlobalKey();
  var keyStreet = GlobalKey();
  var keyHouseNumber = GlobalKey();
  var keyPhoneNumber = GlobalKey();
  var keyEmail = GlobalKey();
  var keyContract = GlobalKey();

  @override
  void initState() {
    super.initState();
    _initProvider();
  }

  _initProvider() async {
    CarsProvider carsProvider = context.read<CarsProvider>();
    runWithLoader(() async {
      await carsProvider.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              AppHelper.headerAdvertise(),
              const SizedBox(
                height: 30,
              ),
              _personsButtons(),
              const SizedBox(
                height: 50,
              ),
              _googleMapsSection(),
              const SizedBox(
                height: 60,
              ),
              _typeCarSection(),
              const SizedBox(
                height: 40,
              ),
              _carsWashingSection(),
              const SizedBox(
                height: 50,
              ),
              _carsCleaningSection(),
              const SizedBox(
                height: 60,
              ),
              _carsOptionsSection(),
              const SizedBox(
                height: 65,
              ),
              _selectDateTimeSection(),
              const SizedBox(
                height: 60,
              ),
              _contactsSection(),
              _invoiceSection(),
              const SizedBox(
                height: 70,
              ),
              _paySection(),
              const SizedBox(
                height: 25,
              ),
              _contractPersonalSection(),
              const SizedBox(
                height: 25,
              ),
              _textOrderInfo(),
              const SizedBox(
                height: 6,
              ),
              AppHelper.footerAdvertize(),
              const SizedBox(
                height: 20,
              ),
              _promocodeSection(),
              const SizedBox(
                height: 26,
              ),
              _referalProgramSection(),
              const SizedBox(
                height: 24,
              ),
              _textFinalCost(),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Замовити ',
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _banner() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColor.orangeRectangleColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset('lib/assets/icons/noun-like.svg'),
            const SizedBox(
              width: 20,
            ),
            const Expanded(
              child: Text(
                'Наші співробітники мають необхідні засоби та інвентарі для прибирання. Пилосос замовити можливо додатково',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFont.heavy,
                    color: Color.fromRGBO(43, 43, 43, 1)),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _personsButtons() {
    return Consumer<CarsProvider>(
      builder: (context, provider, child) {
        return PersonButtons(
          selectionsHuman: provider.selectionsHuman,
          onPressed: (int index) {
            if (((index == 0) && (!provider.selectionsHuman[0])) ||
                ((index == 1) && (!provider.selectionsHuman[1]))) {
              provider.selectionsHuman = [
                !provider.selectionsHuman[0],
                !provider.selectionsHuman[1]
              ];
            }
          },
        );
      },
    );
  }

  Widget _selectDateTimeSection() {
    return Consumer<CarsProvider>(
      builder: (context, provider, child) {
        return DateTimeSection(
          selectedClarifications: provider.selectedClarifications,
          listTimes: provider.listTimes,
          onPressedClarButton: (index) {
            // The button that is tapped is set to true, and the others to false.
            for (int i = 0; i < provider.selectedClarifications.length; i++) {
              provider.selectedClarifications[i] = i == index;
            }
            provider.selectedTime = '';
          },
          onPressedTimeButton: (index, value) {
            provider.listTimes[index]['time'] = value;
            provider.selectedTime = value;
            provider.selectedClarifications = [false, false];
            provider.groupButtonController.unselectAll();
          },
          selectedTime: provider.selectedTime,
          controller: provider.groupButtonController,
          onSelectDate: (date) => provider.selectedDate = date,
          timeKey: keyTime,
        );
      },
    );
  }

  Widget _googleMapsSection() {
    return Column(
      children: const [
        TitlePrimary(title: 'CAR CLEANING IS LOCATED AT'),
      ],
    );
  }

  Widget _typeCarSection() {
    return Consumer<CarsProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            const TitlePrimary(title: 'CHOOSE YOUR CAR TYPE'),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () {
                      provider.setSelectionsCarType([
                        !provider.selectionsCarType[0],
                        !provider.selectionsCarType[1]
                      ]);
                    },
                    child: Container(
                      height: 60,
                      color: provider.selectionsCarType[0]
                          ? AppColor.primary
                          : AppColor.backgroundGridViewItem,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'lib/assets/icons/car.svg',
                            height: 40,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Text(
                              'Personal',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppFont.heavy,
                                  fontWeight: FontWeight.w500,
                                  color: provider.selectionsCarType[0]
                                      ? const Color.fromRGBO(255, 255, 255, 1)
                                      : const Color.fromRGBO(43, 43, 43, 1)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      provider.setSelectionsCarType([
                        !provider.selectionsCarType[0],
                        !provider.selectionsCarType[1]
                      ]);
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: provider.selectionsCarType[1]
                          ? AppColor.primary
                          : AppColor.backgroundGridViewItem,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              'Limousines/terrain/suv',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppFont.heavy,
                                  fontWeight: FontWeight.w500,
                                  color: provider.selectionsCarType[1]
                                      ? const Color.fromRGBO(255, 255, 255, 1)
                                      : const Color.fromRGBO(43, 43, 43, 1)),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset(
                            'lib/assets/icons/suv.svg',
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _carsWashingSection() {
    return Container(
      decoration: AppDecoration.container,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 26, bottom: 26),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Flexible(
                child: Text(
                  'CAR WASHING',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(43, 43, 43, 1)),
                ),
              ),
              Flexible(
                child: Text(
                  'The service includes',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(119, 119, 119, 1)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          Row(
            children: [
              CellSmall('70.00 zł'),
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 50,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/car-washing.svg',
                      height: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Миття корпусу',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.titleBlackMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 50,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/base (1) 1.svg',
                      height: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Миття порогів',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.titleBlackMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 50,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/car-windscreen.svg',
                      height: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Миття вікон ззовні',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.titleBlackMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 50,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/car-wheel.svg',
                      height: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Мийка шин та дисків',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.titleBlackMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 50,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/car-boot.svg',
                      height: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Почорніння шин і зовнішнього пластику',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.titleBlackMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 50,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/clean.svg',
                      height: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Лаковий блиск',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.titleBlackMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _carsCleaningSection() {
    return Container(
      decoration: AppDecoration.container,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 26, bottom: 26),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Flexible(
                child: Text(
                  'CAR CLEANING',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(43, 43, 43, 1)),
                ),
              ),
              Flexible(
                child: Text(
                  'The service includes',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(119, 119, 119, 1)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          Row(
            children: [
              CellSmall('70.00 zł'),
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 50,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/car-vacuum.svg',
                      height: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Пилососити салон',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.titleBlackMedium,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 - 50,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/car-window.svg',
                      height: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Миття вікон зсередини',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.titleBlackMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 50,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/car-plastik.svg',
                      height: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Догляд за пластиком салону',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.titleBlackMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 - 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _carsOptionsSection() {
    return Column(
      children: [
        const TitleSecondary(title: 'COMPLETE'),
        const SizedBox(
          height: 16,
        ),
        Consumer<CarsProvider>(
          builder: (context, provider, child) {
            return CustomGridView(
              padding: const EdgeInsets.only(top: 10),
              listWidget: provider.carsOptionsList(),
              onTap: (index) {
                provider.selectionsCarsWash[index] =
                    !provider.selectionsCarsWash[index];
                setState(() {});
              },
            );
          },
        )
      ],
    );
  }

  Widget _dryCleanerSection() {
    return Column(
      children: [
        const TitleSecondary(title: 'Додаткові опції '),
        const SizedBox(
          height: 19,
        ),
        _vacuumCleaner(),
        const SizedBox(
          height: 18,
        ),
        Column(
          children: [
            const DottedLine(),
            const SizedBox(
              height: 19,
            ),
            _textAdditionalOptions(),
            const SizedBox(
              height: 19,
            ),
            Consumer<DefaultOrderProvider>(builder: (context, provider, child) {
              return Visibility(
                visible: provider.isExpandedOptions,
                child: CustomGridView(
                  padding: const EdgeInsets.only(top: 10),
                  listWidget: provider.dryCleanerList(),
                  onTap: (index) {
                    provider.setSelectionsAddCleanOptions(
                        index, !provider.selectionsAddCleanOptions[index]);
                  },
                ),
              );
            })
          ],
        ),
      ],
    );
  }

  Widget _vacuumCleaner() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCheckbox(
              onChanged: () {},
            ),
            const SizedBox(
              width: 37,
            ),
            SvgPicture.asset(
              'lib/assets/icons/vacuum-hand.svg',
              width: 36,
              height: 52,
            )
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'Додати ручний пилосос до замовлнення',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              fontFamily: AppFont.heavy,
              color: Color.fromRGBO(
                43,
                43,
                43,
                1,
              )),
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          'На замовленні немає свого пилососа',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: AppFont.heavy,
              color: Color.fromRGBO(
                43,
                43,
                43,
                0.94,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        CellSmall('25.00 zł')
      ],
    );
  }

  Widget _textAdditionalOptions() {
    return Consumer<DefaultOrderProvider>(
      builder: (context, provider, child) {
        return InkWell(
          onTap: () {
            provider.turns += 1 / 2;
            provider.isExpandedOptions = !provider.isExpandedOptions;
          },
          child: Container(
            padding: const EdgeInsets.only(top: 24, bottom: 18),
            decoration: BoxDecoration(
                color: AppColor.containersBackgroundColor,
                borderRadius:
                    BorderRadius.circular(AppValues.regularCornerRadius)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('lib/assets/icons/dry-order.svg'),
                const SizedBox(
                  height: 21,
                ),
                Text(
                  'Замовити хімчістку меблів та килимів водночас із прибиранням',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.titleBlackBig,
                ),
                const SizedBox(
                  height: 13,
                ),
                AnimatedRotation(
                    turns: provider.turns,
                    duration: const Duration(milliseconds: 300),
                    child: SvgPicture.asset('lib/assets/icons/vector.svg')),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _contactsSection() {
    return Consumer<CarsProvider>(
      builder: (context, provider, child) {
        return ContactsSection(
          name: _name,
          phone: _phoneNumber,
          email: _email,
          additionalInfo: _additionalInfo,
          nameNode: _nameNode,
          phoneNumberNode: _phoneNumberNode,
          emailNode: _emailNode,
          additionalInfoNode: __additionalInfoNode,
          onNameTyping: (x) => provider.name = x,
          onPhoneTyping: (x) => provider.phoneNumber = x,
          onEmailTyping: (x) => provider.email = x,
          onAdditionalInfoTyping: (x) => provider.additionalInfo = x,
        );
      },
    );
  }

  Widget _invoiceSection() {
    return Consumer<CarsProvider>(
      builder: (context, provider, child) {
        return Visibility(
          visible: provider.selectionsHuman[1],
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              InvoiceSection(
                invoiceName: _invoiceName,
                invoiceNip: _invoiceNip,
                invoiceAdress: _invoiceAdress,
                invoicePostalCode: _invoicePostalCode,
                invoiceNameNode: _invoiceNameNode,
                invoiceNipNode: _invoiceNipNode,
                invoiceAddressNode: _invoiceAddressNode,
                invoicePostalCodeNode: _invoicePostalCodeNode,
                title: 'Data for vat invoice',
                onFirstNameTyping: (x) => provider.invoiceFirstName = x,
                onNipTyping: (x) => provider.invoiceNip = x,
                onAdressTyping: (x) => provider.invoiceAddress = x,
                onPostalCodeTyping: (x) => provider.invoicePostalCode = x,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _contactsForm() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode: _nameNode,
                  controller: _name,
                  labelText: 'Ваше ім\'я',
                  onTyping: () {}),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CustomTextField(
                focusNode: _phoneNumberNode,
                controller: _phoneNumber,
                leftPadding: 100,
                keyboardType: TextInputType.phone,
                contentPadding: const EdgeInsets.only(
                    left: 120, top: 8, bottom: 8, right: 16),
                labelText: 'Контактний телефон',
                onTyping: () {}),
            Container(
              height: AppValues.textFieldHeight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: const Color.fromRGBO(237, 237, 237, 1),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('lib/assets/icons/flag-ukraine.svg'),
                  const SizedBox(
                    width: 7,
                  ),
                  const Text('+380'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode: _emailNode,
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'E-mail адреса',
                  onTyping: () {}),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode: __additionalInfoNode,
                  controller: _additionalInfo,
                  textFieldHeight: 124,
                  labelText: 'Додаткова інформація про замовлення',
                  onTyping: () {}),
            ),
          ],
        ),
      ],
    );
  }

  Widget _paySection() {
    return Container(
      child: Column(
        children: [
          const DividerTitle(title: 'Оберіть спосіб оплати'),
          const SizedBox(
            height: 30,
          ),
          const TitleSecondary(title: 'Cпосіб оплати'),
          const SizedBox(
            height: 20,
          ),
          Consumer<DefaultOrderProvider>(
            builder: (context, provider, child) {
              return Row(
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          provider.selectionsPayMethod(
                              0, !provider.selectionsSelectPay[0]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: provider.selectionsSelectPay[0]
                                  ? AppColor.primary
                                  : AppColor.textFieldFill,
                              borderRadius: BorderRadius.circular(4)),
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              SvgPicture.asset(
                                'lib/assets/icons/cash.svg',
                                height: 32,
                                width: 56,
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Text(
                                'Готівкою',
                                style: TextStyle(
                                    color: provider.selectionsSelectPay[0]
                                        ? Colors.white
                                        : const Color.fromRGBO(64, 64, 64, 1),
                                    fontFamily: AppFont.heavy,
                                    fontSize: 17),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          provider.selectionsPayMethod(
                              1, !provider.selectionsSelectPay[1]);
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              color: provider.selectionsSelectPay[1]
                                  ? AppColor.primary
                                  : AppColor.textFieldFill,
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              SvgPicture.asset(
                                'lib/assets/icons/card.svg',
                                height: 32,
                                width: 56,
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Text(
                                'Карткою online',
                                style: TextStyle(
                                    color: provider.selectionsSelectPay[1]
                                        ? Colors.white
                                        : const Color.fromRGBO(64, 64, 64, 1),
                                    fontFamily: AppFont.heavy,
                                    fontSize: 17),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("lib/assets/icons/apple-pay.png",
                                      width: 29, height: 29),
                                  const Text(' / '),
                                  Image.asset("lib/assets/icons/google-pay.png",
                                      width: 29, height: 21),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _contractPersonalSection() {
    return Consumer<CarsProvider>(
      builder: (context, provider, child) {
        return ContractPersonalSection(
          isSelectedPublicContract: provider.isSelectedPublicContract,
          isSelectedUsePersonalData: provider.isSelectedUsePersonalData,
          onCheckContract: (value) {
            provider.isSelectedPublicContract = value;
          },
          onCheckPersonalData: (value) {
            provider.isSelectedUsePersonalData = value;
          },
        );
      },
    );
  }

  Widget _textOrderInfo() {
    return Container(
      color: AppColor.textFieldFill,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 18.0, right: 18, bottom: 18, left: 22),
        child: Center(
          child: Row(
            children: const [
              Text(
                'Car washing and cleaning',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: AppFont.heavy,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _promocodeSection() {
    return Consumer<CarsProvider>(
      builder: (context, provider, child) {
        return PromocodeSection(
            promocode: _promocode,
            promocodeNode: _promocodeNode,
            onTyping: (x) => provider.promocode = x,
            onApply: () => provider.onApplyPromo());
      },
    );
  }

  Widget _referalProgramSection() {
    return Consumer<CarsProvider>(
      builder: (context, provider, child) {
        return RefferalProgramSection(
          referral: _refferal,
          turnsRefferal: provider.turnsRefferal,
          refferalNode: _refferalNode,
          onTyping: (x) {
            provider.refferal = x;
          },
          onApply: () {
            provider.onApplyReferal();
          },
          isExpandedRefferal: provider.isExpandedRefferal,
          onCollapseExpand: () {
            provider.turnsRefferal += 1 / 2;
            provider.isExpandedRefferal = !provider.isExpandedRefferal;
          },
        );
      },
    );
  }

  Widget _textFinalCost() {
    return Row(
      children: const [
        Text(
          'До оплати:',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        SizedBox(
          width: 22,
        ),
        Text(
          '125.00 zł  ',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ],
    );
  }
}

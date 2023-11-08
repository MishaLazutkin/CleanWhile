import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../utils/app_helper.dart';
import '../../utils/style.dart';
import '../../widgets/all.dart';
import '../../widgets/triangle_shape.dart';

class KitchenTab extends StatefulWidget {
  const KitchenTab({Key? key}) : super(key: key);

  @override
  State<KitchenTab> createState() => _KitchenTabState();
}

class _KitchenTabState extends State<KitchenTab>
    with FullscreenLoaderMixin<KitchenTab> {
  final TextEditingController _street = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();
  final TextEditingController _houseNumber = TextEditingController();
  final TextEditingController _flatNumber = TextEditingController();
  final TextEditingController _frame = TextEditingController();
  final TextEditingController _entranceNumber = TextEditingController();
  final TextEditingController _floorNumber = TextEditingController();
  final TextEditingController _intercomCode = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _additionalInfo = TextEditingController();
  final TextEditingController _promocode = TextEditingController();
  final TextEditingController _refferal = TextEditingController();
  final TextEditingController _beforeClean = TextEditingController();
  final TextEditingController _afterClean = TextEditingController();

  final TextEditingController _invoiceName = TextEditingController();
  final TextEditingController _invoiceNip = TextEditingController();
  final TextEditingController _invoiceAdress = TextEditingController();
  final TextEditingController _invoicePostalCode = TextEditingController();

  final FocusNode _streetNode = FocusNode();
  final FocusNode _postalCodeNode = FocusNode();
  final FocusNode _houseNumberCodeNode = FocusNode();
  final FocusNode _flatNumberNode = FocusNode();
  final FocusNode _frameNode = FocusNode();
  final FocusNode _entranceNumberNode = FocusNode();
  final FocusNode _floorNumberNode = FocusNode();
  final FocusNode _itercomCodeNode = FocusNode();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _phoneNumberNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode __additionalInfoNode = FocusNode();
  final FocusNode _promocodeNode = FocusNode();
  final FocusNode _refferalNode = FocusNode();
  final FocusNode _beforeNode = FocusNode();
  final FocusNode _afterNode = FocusNode();
  final FocusNode _invoiceNameNode = FocusNode();
  final FocusNode _invoiceNipNode = FocusNode();
  final FocusNode _invoiceAddressNode = FocusNode();
  final FocusNode _invoicePostalCodeNode = FocusNode();
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
    KitchenProvider kitchenProvider = context.read<KitchenProvider>();
    runWithLoader(() async {
      await kitchenProvider.init();
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
              _yourKitchenSection(),
              const SizedBox(
                height: 35,
              ),
              const DottedLine(),
              const SizedBox(
                height: 40,
              ),
              _cleanConsists(),
              const SizedBox(
                height: 60,
              ),
              _dryCleanerSection(),
              const SizedBox(
                height: 38,
              ),
              _deliveryKeysSection(),
              const SizedBox(
                height: 60,
              ),
              _selectDateTimeSection(),
              const SizedBox(
                height: 70,
              ),
              _adressSection(),
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
              _bottomSection(),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Замовити за  149.90 zł',
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
    return Consumer<KitchenProvider>(
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

  Widget _yourKitchenSection() {
    return Column(
      children: [
        const TitlePrimary(title: 'Прибирання кухні'),
        const SizedBox(
          height: 30,
        ),
        _picture(),
        const SizedBox(
          height: 31,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.0),
          child: Text(
            'Прибирання всієї кухні — це повномаштабне 5-6 годинне прибирання всього, що є на кухні. Ми миємо всю техніку всередині та зовні. Витираємо всі меблі, наводимо порядок, викидаємо сміття і замінюємо сміттєві мішки.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: AppFont.heavy,
                fontSize: 18,
                color: Color.fromRGBO(43, 43, 43, 1)),
          ),
        ),
        const SizedBox(
          height: 23,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 40),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(89, 183, 139, 1),
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Час на прибирання',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: AppFont.heavy,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: ' 5-6 годин ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AppFont.heavy,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ), //<-- SEE HERE
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(89, 183, 139, 1),
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Фіксована ціна Фіксована ФіксованаФіксована',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: AppFont.heavy,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: '  219.00 zł',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AppFont.heavy,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ), //<-- SEE HERE
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _picture() {
    return SvgPicture.asset('lib/assets/icons/kitchen-big 1.svg');
  }

  Widget _cleanConsists() {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: Center(
                child: Text(
                  'З чого складається прибирання',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 22,
        ),
        _shadowContainer('Миємо всередині та ззовні'),
        const SizedBox(
          height: 18,
        ),
        Consumer<KitchenProvider>(
          builder: (context, provider, child) {
            return CustomGridView(
              padding: EdgeInsets.zero,
              listWidget: provider.innerOuterOptionsList(),
            );
          },
        ),
        const SizedBox(
          height: 40,
        ),
        _shadowContainer('Протираємо і прибираємо'),
        const SizedBox(
          height: 18,
        ),
        Consumer<KitchenProvider>(
          builder: (context, provider, child) {
            return CustomGridView(
              padding: EdgeInsets.zero,
              listWidget: provider.wipeCleanOptionsList(),
            );
          },
        ),
        const SizedBox(
          height: 40,
        ),
        _shadowContainer('А також'),
        const SizedBox(
          height: 18,
        ),
        Consumer<KitchenProvider>(
          builder: (context, provider, child) {
            return CustomGridView(
              padding: EdgeInsets.zero,
              listWidget: provider.alsoCleanOptionsList(),
            );
          },
        ),
      ],
    );
  }

  Widget _shadowContainer(String title) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      spreadRadius: 0.3,
                      blurRadius: 10,
                      offset: Offset.fromDirection(5)
                      //blurStyle:BlurStyle.solid
                      )
                ]),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          '$title',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppFont.heavy,
                              color: Color.fromRGBO(43, 43, 43, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomPaint(size: Size(10, 10), painter: TriangleShape()),
              ],
            )),
      ],
    );
  }

  Widget _selectDateTimeSection() {
    return Consumer<KitchenProvider>(
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

  Widget _dryCleanerSection() {
    return Consumer<KitchenProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            const DottedLine(),
            const SizedBox(
              height: 18,
            ),
            _textDryCleanOptions(),
            Visibility(
              visible: provider.isExpandedCleanOptions,
              child: Column(
                children: [
                  CustomGridView(
                      padding: const EdgeInsets.only(top: 10),
                      listWidget: provider.dryCleanerList(),
                      onTap: (index) {
                        provider.setSelectionsDryCleaner(
                            index, !provider.selectionsDryCleaner[index]);
                      })
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const DottedLine(),
          ],
        );
      },
    );
  }

  Widget _textDryCleanOptions() {
    return Consumer<KitchenProvider>(
      builder: (context, provider, child) {
        return InkWell(
          onTap: () {
            provider.turns += 1 / 2;
            provider.isExpandedCleanOptions = !provider.isExpandedCleanOptions;
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Замовити хімчістку меблів та килимів водночас із прибиранням',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.titleBlackBig,
                  ),
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

  Widget _deliveryKeysSection() {
    return Consumer<KitchenProvider>(
      builder: (context, provider, child) {
        return DeliveryKeysSection(
          onCheckDelivery: (value) {
            provider.isCheckedDelivery = value;
          },
          selectedTakeKeys: provider.selectedTakeKeys,
          isCheckedDelivery: provider.isCheckedDelivery,
          beforeNode: _beforeNode,
          afterNode: _afterNode,
          beforeClean: _beforeClean,
          afterClean: _afterClean,
          onTypingBefore: (x) {
            provider.adressKeysBefore = x;
          },
          onTypingAfter: (x) {
            provider.adressKeysAfter = x;
          },
          onTapTakeKeys: (index) {
            if (index == 0) {
              provider.selectedTakeKeys = [
                !provider.selectedTakeKeys[0],
                provider.selectedTakeKeys[1],
              ];
            }
            if (index == 1) {
              provider.selectedTakeKeys = [
                provider.selectedTakeKeys[0],
                !provider.selectedTakeKeys[1],
              ];
            }
          },
        );
      },
    );
  }

  Widget _adressSection() {
    return Column(
      children: [
        const DividerTitle(title: 'Вкажіть Вашу адресу'),
        const SizedBox(
          height: 37,
        ),
        Consumer<KitchenProvider>(
          builder: (context, provider, child) {
            return AdressSection(
              street: _street,
              postalCode: _postalCode,
              houseNumber: _houseNumber,
              flatNumber: _flatNumber,
              frame: _frame,
              entranceNumber: _entranceNumber,
              floorNumber: _floorNumber,
              intercomCode: _intercomCode,
              streetNode: _streetNode,
              postalCodeNode: _postalCodeNode,
              houseNumberCodeNode: _houseNumberCodeNode,
              flatNumberNode: _flatNumberNode,
              frameNode: _frameNode,
              entranceNumberNode: _entranceNumberNode,
              floorNumberNode: _floorNumberNode,
              itercomCodeNode: _itercomCodeNode,
              title: 'Ваша адреса',
              listCities: provider.listCities,
              selectedValue: provider.selectedCity,
              onValuesSelected: (x) {
                provider.selectedCity = x;
              },
              onStreetTyping: (x) {
                provider.street = x;
              },
              onPostalCodeTyping: (x) {
                provider.postalCode = x;
              },
              onNumbHouseTyping: (x) {
                provider.houseNumber = x;
              },
              onNumbFlatTyping: (x) {
                provider.flatNumber = x;
              },
              onFrameTyping: (x) {
                provider.frame = x;
              },
              onEntranceTyping: (x) {
                provider.entranceNumber = x;
              },
              onNumbFloorTyping: (x) {
                provider.floorNumber = x;
              },
              onCodeIntercomeTyping: (x) {
                provider.intercomCode = x;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _contactsSection() {
    return Consumer<KitchenProvider>(
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
    return Consumer<KitchenProvider>(
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
    return Consumer<KitchenProvider>(
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
    return Padding(
      padding:
          const EdgeInsets.only(top: 18.0, right: 18, bottom: 18, left: 22),
      child: Row(
        children: [
          Text(
            'Прибирання кухні 219.00 zl',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _banner2() {
    return Container(
      padding:
          const EdgeInsets.only(top: 18.0, right: 18, bottom: 18, left: 22),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.regularCornerRadius),
        color: const Color.fromRGBO(255, 234, 132, 1),
      ),
      child: Row(
        children: [
          SvgPicture.asset('lib/assets/icons/detergents.svg'),
          const SizedBox(
            width: 33,
          ),
          const Expanded(
            child: Text(
              'Наші співробітники мають необхідні засоби та інвентар для прибирання. Пилосос замовити можливо додатково',
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
    );
  }

  Widget _textDataInfo() {
    return Row(
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Приблизний час на прибирання ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFont.heavy,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              TextSpan(
                text: '3 години',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppFont.heavy,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ), //<-- SEE HERE
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _referalProgramSection() {
    return Consumer<KitchenProvider>(
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
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 22,
        ),
        Text(
          '0 zł ',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _bottomSection() {
    return Container(
      //color: AppColor.textFieldFill,
      child: Column(
        children: [
          _textOrderInfo(),
          const SizedBox(
            height: 6,
          ),
          AppHelper.footerAdvertize(),
          const SizedBox(
            height: 20,
          ),
          _textDataInfo(),
          const SizedBox(
            height: 26,
          ),
          _referalProgramSection(),
          const SizedBox(
            height: 24,
          ),
          _textFinalCost(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../utils/app_helper.dart';
import '../../utils/style.dart';
import '../../widgets/all.dart';

class WindowsTab extends StatefulWidget {
  const WindowsTab({Key? key}) : super(key: key);

  @override
  State<WindowsTab> createState() => _WindowsTabState();
}

class _WindowsTabState extends State<WindowsTab>
    with FullscreenLoaderMixin<WindowsTab> {
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
    WindowProvider windowCleanerProvider =
        context.read<WindowProvider>();
    runWithLoader(() async {
      await windowCleanerProvider.init();
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
              _yourWindowSection(),
              const SizedBox(
                height: 42,
              ),
              _calculationRulesSection(),
              const SizedBox(
                height: 30,
              ),
              _yourBalconySection(),
              const SizedBox(
                height: 45,
              ),
              _cleanFlatSection(),
              const SizedBox(
                height: 60,
              ),
              _selectDateTimeSection(),
              const SizedBox(
                height: 60,
              ),
              DottedLine(),
              const SizedBox(
                height: 38,
              ),
              _deliveryKeysSection(),
              const SizedBox(
                height: 70,
              ),
              _adressSection(),
              const SizedBox(
                height: 27,
              ),
              const DottedLine(),
              const SizedBox(
                height: 50,
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
              _textDataInfo(),
              const SizedBox(
                height: 26,
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
                text: 'Замовити за 0 zł',
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


  Widget _personsButtons() {
    return Consumer<WindowProvider>(
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

  Widget _yourWindowSection() {
    return Column(
      children: [
        const TitleSecondary(title: 'Вкажіть кількість вікон'),
        const SizedBox(
          height: 15,
        ),
        SvgPicture.asset(
          'lib/assets/icons/window-order.svg',
          height: 72,
        ),
        const SizedBox(
          height: 22,
        ),
        Center(
          child: Column(
            children: [
              Consumer<WindowProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: [
                      CounterPrimaryWidget(
                        '${provider.windowCount} вікон',
                        onIncrementTap: () =>
                        provider.windowCount = provider.windowCount + 1,
                        onDecrementTap: () {
                          if (provider.windowCount > 0) {
                            provider.windowCount = provider.windowCount - 1;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CellSmall('45.00 zl')
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Вартість миття одного вікна з середини',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: AppFont.heavy,
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              CellSmall('25.00 zl')
            ],
          ),
        ),
        const SizedBox(
          height: 21,
        ),
        const Text(
          '* Мінімальна кількість 5. Якщо у вас менше вікон, замовляйте прибирання однокімнатної квартири та потрібну кількість вікон',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: AppFont.heavy,
              fontSize: 13,
              height: 1.5,
              color: Color.fromRGBO(119, 119, 119, 1),
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }


  Widget _calculationRulesSection() {
    return Consumer<WindowProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                provider.isExpandedCalcRules = !provider.isExpandedCalcRules;
              },
              child: Container(
                height: 45,
                decoration: AppDecoration.container,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                      flex: 3,
                      child: Text(
                        'Як ми розраховуємо кількість вікон',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: AppFont.heavy,
                            fontSize: 15,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Flexible(
                        flex: 1,
                        child: SvgPicture.asset(
                          'lib/assets/icons/vector.svg',
                          height: 5,
                        ))
                  ],
                ),
              ),
            ),
            Visibility(
              visible: provider.isExpandedCalcRules,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                            fontSize: 17,
                            height: 1.5,
                            fontFamily: AppFont.heavy,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text:
                                'Ми рахуємо вікна по стулках.\n Вони можуть відрізнятися розміром,\n',
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: AppFont.heavy,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                          TextSpan(
                            text: ' головне - їх кількість.  ',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: AppFont.heavy,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ), //<-- SEE HERE
                          ),
                        ],
                      ),
                    ),
                  ),
                  Consumer<WindowProvider>(
                      builder: (context, provider, child) {
                    return CustomGridView(
                        padding: const EdgeInsets.only(top: 10),
                        crossAxisCount: 2,
                        listWidget: provider.windowsRulesList(),

                    );
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Якщо у вашому замовленні виходить 9,5 вікон, ми округляємо цифру в меншу сторону — до 9.'
                    'Одна шибка / секція французького вікна (вікна до підлоги) — це одне вікно. Якщо у вас вікна з подвійними рамами, це рахується як два вікна.'
                    'Ви можете замовити миття вікон окремо, а можете замовити разом із прибиранням квартири. Замовлення можна оплатити карткою або готівкою. У холодну пору року ми миємо вікна з одного боку.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color.fromRGBO(119, 119, 119, 1),
                        fontFamily: AppFont.heavy),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _yourBalconySection() {
    return Consumer<WindowProvider>(
  builder: (context, provider, child) {
  return Column(
      children: [
        const DottedLine(),
        const SizedBox(
          height: 20,
        ),
        SvgPicture.asset('lib/assets/icons/balcony.svg'),
        const SizedBox(
          height: 20,
        ),
        CellSmall('25 zl'),
        const SizedBox(
          height: 20,
        ),
        CounterPrimaryWidget(
          '${provider.balconiesCount}',
          onIncrementTap: () =>
          provider.balconiesCount = provider.balconiesCount + 1,
          onDecrementTap: () {
            if (provider.balconiesCount > 0) {
              provider.balconiesCount = provider.balconiesCount - 1;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const DottedLine(),
      ],
    );
  },
);
  }

  Widget _cleanFlatSection() {
    return Column(
      children: [
        Column(
          children: [
            _textAdditionalOptions(),
            const SizedBox(
              height: 19,
            ),
            Consumer<WindowProvider>(
                builder: (context, provider, child) {
              return Visibility(
                visible: provider.isExpandedAdditionalOptions,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    _yourFlatSection(),
                    const SizedBox(
                      height: 60,
                    ),
                    _advertisement(),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomGridView(
                      padding: const EdgeInsets.only(top: 10),

                      listWidget: provider.cleanerOptionsList(),
                      onTap: (index) {
                        provider.setSelectionsAddCleanOptions(
                            index, !provider.selectionsAddCleanOptions[index]);
                      },
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    _vacuumCleanerSection(),
                  ],
                ),
              );
            }),
          ],
        )
      ],
    );
  }
  Widget _yourFlatSection() {
    return Column(
      children: [
        Consumer<WindowProvider>(
          builder: (context, provider, child) {
            return YourFlatSection(
              title: 'Ваша квартира',
              onIncRoom: () {
                provider.roomCount = provider.roomCount + 1;
              },
              onDecRoom: () {
                if (provider.roomCount > 0) {
                  provider.roomCount = provider.roomCount - 1;
                }
              },
              onIncSanitaryUnit: () {
                provider.sanitaryUnitCount = provider.sanitaryUnitCount + 1;
              },
              onDecSanitaryUnit: () {
                if (provider.sanitaryUnitCount > 0) {
                  provider.sanitaryUnitCount = provider.sanitaryUnitCount - 1;
                }
              },
              onCheckKitchen: (value) {
                provider.isCheckedKitchen = value;
                if (value) {
                  provider.isCheckedAnex = false;
                } else {
                  provider.isCheckedAnex = true;
                }
              },
              onCheckAnex: (value) {
                provider.isCheckedAnex = value;
                if (value) {
                  provider.isCheckedKitchen = false;
                } else {
                  provider.isCheckedKitchen = true;
                }
              },
              roomCount: provider.roomCount,
              sanitaryUnitCount: provider.sanitaryUnitCount,
              isCheckedKitchen: provider.isCheckedKitchen,
              isCheckedAnex: provider.isCheckedAnex,
            );
          },
        ),
        _privateHouse(),
      ],
    );


  }




  Widget _privateHouse() {
    return Consumer<WindowProvider>(
      builder: (context, provider, child) {
        return PrivateHouseSection(
          onCheckHouse: (value) {
            provider.isCheckedPrivateHouse = value;
          },
          isCheckedHouse: provider.isCheckedPrivateHouse,
        );
      },
    );
  }


  Widget _advertisement() {
    return Consumer<WindowProvider>(
      builder: (context, provider, child) {
        return DiscountSection(
          selectedDiscountId: provider.selectedDiscountId,
          discountDataList: provider.discountDataList,
          onTap: (index) {
            provider.selectedDiscountId = provider.discountDataList[index]['id'];
          },
        );
      },
    );
  }

  Widget _vacuumCleanerSection() {
    return Consumer<WindowProvider>(
      builder: (context, provider, child) {
        return VacuumCleanerSection(
          isChecked: provider.isCheckedVacuum,
          onCheckVacuum: (value) {
            provider.isCheckedVacuum = value;
          },
        );
      },
    );
  }

  Widget _selectDateTimeSection() {
    return Consumer<WindowProvider>(
      builder: (context, provider, child) {
        return DateTimeSection(
            selectedClarifications: provider.selectedClarifications,
            listTimes: provider.listTimes,
            onPressedClarButton: (index) {
              // The button that is tapped is set to true, and the others to false.
              for (int i = 0; i < provider.selectedClarifications.length; i++) {
                provider.selectedClarifications[i] = i == index;
              }
              provider.selectedTime='';
            },
          onPressedTimeButton: (index,value ) {
            provider.listTimes[index]['time'] = value;
            provider.selectedTime  = value;
            provider.selectedClarifications=[false,false];
            provider.groupButtonController.unselectAll();
          },
          selectedTime: provider.selectedTime,
          controller: provider.groupButtonController ,
          onSelectDate: (date) => provider.selectedDate=date,
          timeKey: keyTime,
        );
      },
    );
  }

  Widget _textAdditionalOptions() {
    return Consumer<WindowProvider>(
      builder: (context, provider, child) {
        return InkWell(
          onTap: () {
            provider.turns += 1 / 2;
            provider.isExpandedAdditionalOptions =
                !provider.isExpandedAdditionalOptions;
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
                SvgPicture.asset('lib/assets/icons/default-order.svg'),
                const SizedBox(
                  height: 21,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Замовити прибирання квартири водночас із миттям вікон',
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

  Widget _deliveryKeysSection() {
    return Consumer<WindowProvider>(
      builder: (context, provider, child) {
        return DeliveryKeysSection(
          onCheckDelivery: (value) {
            provider.isCheckedDelivery = value;
          },
          selectedTakeKeys: provider.selectedTakeKeys,
          isCheckedDelivery: provider.isCheckedDelivery,
          beforeNode: _beforeNode,
          afterNode: _afterNode,
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
          beforeClean: _beforeClean,
          afterClean: _afterClean,
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
        Consumer<WindowProvider>(
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
    return    Consumer<WindowProvider>(
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
    return Consumer<WindowProvider>(
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
                onNipTyping:
                    (x) => provider.invoiceNip = x,
                onAdressTyping:
                    (x) => provider.invoiceAddress = x,
                onPostalCodeTyping:
                    (x) => provider.invoicePostalCode = x,),
            ],
          ),
        );
      },
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
    return  Consumer<WindowProvider>(
      builder: (context, provider, child) {
        return ContractPersonalSection(
          isSelectedPublicContract: provider.isSelectedPublicContract,
          isSelectedUsePersonalData: provider.isSelectedUsePersonalData,
          onCheckContract: (value) {provider.isSelectedPublicContract = value;},
          onCheckPersonalData: (value) {provider.isSelectedUsePersonalData = value;},
        );
      },
    );
  }
  Widget _textOrderInfo() {
    return Container(
      width: double.infinity,
      color: AppColor.textFieldFill,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 18.0, right: 18, bottom: 18, left: 22),
        child: Column(
          children:   [
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'Миття вікон 125.00 zl   ',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
              ],
            ),
             SizedBox(height: 8,),
            DottedLine(),
            SizedBox(height: 8,),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'Прибирання квартири з 1 житловою та 2 ванними кімнатами, кухня, коридор 189.90 zł',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: AppFont.heavy,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _banner2() {
    return Container(
      padding:
          const EdgeInsets.only(top: 18.0, right: 18, bottom: 18, left: 22),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Площа ',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.heavy,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '0 м2',
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
            const SizedBox(
              height: 14,
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Кільксть вікон ',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.heavy,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '0 ',
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
            const SizedBox(
              height: 14,
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Приблизний час роботи ',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.heavy,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '0 ',
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
        ),
      ],
    );
  }

  Widget _promocodeSection() {
    return Consumer<WindowProvider>(
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
    return Consumer<WindowProvider>(
      builder: (context, provider, child) {
        return RefferalProgramSection(
          referral: _refferal,
          turnsRefferal: provider.turnsRefferal,
          refferalNode: _refferalNode,
          onTyping: (x) {provider.refferal=x;},
          onApply: (){provider.onApplyReferal();},
          isExpandedRefferal: provider.isExpandedRefferal,
          onCollapseExpand:() {
            provider.turnsRefferal += 1 / 2;
            provider.isExpandedRefferal = !provider.isExpandedRefferal;
          },);
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
          '125.90 zł ',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../utils/app_helper.dart';
import '../../utils/style.dart';
import '../../widgets/all.dart';

class OfficeTab extends StatefulWidget {
  const OfficeTab({Key? key}) : super(key: key);

  @override
  State<OfficeTab> createState() => _OfficeTabState();
}

class _OfficeTabState extends State<OfficeTab>
    with FullscreenLoaderMixin<OfficeTab> {
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
    OfficeProvider officeProvider = context.read<OfficeProvider>();
    runWithLoader(() async {
      await officeProvider.init();
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
                height: 33,
              ),
              _minimalOrder(),
              const SizedBox(
                height: 45,
              ),
              const TitleSecondary(title: 'Опишiть ваш офic'),
              const SizedBox(
                height: 35,
              ),
              _yourOfficeSection(),
              const SizedBox(
                height: 60,
              ),
              _vacuumCleanerSection(),
              const SizedBox(
                height: 18,
              ),

              _dryCleanerSection(),

              const SizedBox(
                height: 45,
              ),
              const SizedBox(
                height: 32,
              ),
              _selectDateTimeSection(),
              const SizedBox(
                height: 65,
              ),
              _advertisement(),
              const SizedBox(
                height: 65,
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
                height: 40,
              ),
              _invoceRules(),
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
                text: 'Замовити за  125.00 zł',
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
    return Consumer<OfficeProvider>(
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

 

  Widget _minimalOrder() {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 184, 0, 1),
          borderRadius: BorderRadius.circular(AppValues.regularCornerRadius)),
      padding: const EdgeInsets.all(13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
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
                    text: 'Мінімальне замовлення для офісу ',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.heavy,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(43, 43, 43, 1)),
                  ),
                  TextSpan(
                    text: '166.05 zł ',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ), //<-- SEE HERE
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _yourOfficeSection() {
    return Consumer<OfficeProvider>(
  builder: (context, provider, child) {
  return Column(
      children: [
        CounterPrimaryWidget(
          '${provider.square} Площа м2',
          onIncrementTap: () =>
          provider.square = provider.square + 1,
          onDecrementTap: () {
            if (provider.square > 0) {
              provider.square = provider.square - 1;
            }
          },
        ),
        
       
        const SizedBox(
          height: 15,
        ),
        CellSmall('160 zl/m2'),
      ],
    );
  },
);
  }

  Widget _vacuumCleanerSection() {
    return Consumer<OfficeProvider>(
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

  Widget _dryCleanerSection() {
    return Consumer<OfficeProvider>(
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
    return Consumer<OfficeProvider>(
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

  Widget _selectDateTimeSection() {
    return Consumer<OfficeProvider>(
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
          controller: provider.groupButtonController,
          onSelectDate: (date) => provider.selectedDate=date,
          timeKey: keyTime,
        );
      },
    );
  }

  Widget _advertisement() {
    return Consumer<OfficeProvider>(
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
  Widget _textAdditionalOptions() {
    return Consumer<DryCleanerProvider>(
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

  Widget _deliveryKeys() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCheckbox(  onChanged: (){},),
              const SizedBox(
                width: 37,
              ),
              SvgPicture.asset(
                'lib/assets/icons/keys.svg',
                width: 36,
                height: 52,
              )
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          Text(
            'Доставлення ключів',
            style: AppTextStyle.titleBlackMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: AppColor.containersBackgroundColor,
                borderRadius:
                    BorderRadius.circular(AppValues.regularCornerRadius)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    'Забрати ключі перед прибиранням',
                    style: AppTextStyle.titleBlackSmall,
                  )),
                  CellSmall('25 zl')
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: AppColor.containersBackgroundColor,
                borderRadius:
                    BorderRadius.circular(AppValues.regularCornerRadius)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    'Забрати ключі після прибиранням',
                    style: AppTextStyle.titleBlackSmall,
                  )),
                  CellSmall('25 zl')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _adressSection() {
    return Column(
      children: [
        const DividerTitle(title: 'Вкажіть Вашу адресу'),
        const SizedBox(
          height: 37,
        ),
        Consumer<OfficeProvider>(
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
    return    Consumer<OfficeProvider>(
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

  Widget _invoiceSection() {
    return    Consumer<OfficeProvider>(
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

  Widget _invoceRules() {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 184, 0, 1),
          borderRadius: BorderRadius.circular(AppValues.regularCornerRadius)),
      padding: const EdgeInsets.all(13),
      child: Column(
        children: [
          SvgPicture.asset('lib/assets/icons/invoice.svg'),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Flexible(
                child: Text(
                  'Invoices are available only for orders paid by card cardcardcardcard',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFont.heavy,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(43, 43, 43, 1)),
                ),
              ),
            ],
          ),
        ],
      ),
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
                          height: 150,
                          decoration: BoxDecoration(
                              color: provider.selectionsSelectPay[0]
                                  ? AppColor.primary
                                  : AppColor.textFieldFill,
                              borderRadius: BorderRadius.circular(4)),
                          padding: const EdgeInsets.symmetric(horizontal: 13.0),
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
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: provider.selectionsSelectPay[0]
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
                          padding: const EdgeInsets.symmetric(horizontal: 13.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              SvgPicture.asset(
                                'lib/assets/icons/after.svg',
                                height: 32,
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'By card or bank transfer after completion of cleaning',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: provider.selectionsSelectPay[1]
                                              ? Colors.white
                                              : const Color.fromRGBO(
                                                  64, 64, 64, 1),
                                          fontFamily: AppFont.heavy,
                                          fontSize: 16),
                                    ),
                                  ),
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
    return  Consumer<HandyManProvider>(
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
      color: AppColor.textFieldFill,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 18.0, right: 18, bottom: 18, left: 22),
        child: Row(
          children: const [
            Expanded(
              child: Center(
                child: Text(
                  'Прибирання в офісах 166.05 zl',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
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
    return Consumer<OfficeProvider>(
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
    return Consumer<OfficeProvider>(
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
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'До оплати:',
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,
                fontFamily: AppFont.heavy,
                color: Color.fromRGBO(0, 0, 0, 1),),
            ),
            SizedBox(
              width: 22,
            ),
            Text(
              '125 zł ',
              style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,
                fontFamily: AppFont.heavy,
                color: Color.fromRGBO(0, 0, 0, 1),),
            ),
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        Row(
          children: [
            SvgPicture.asset('lib/assets/icons/vat.svg',height: 23,),
            const SizedBox(
              width: 17.5,
            ),
            const Expanded(
              child: Text('Price includes VAT, invoice will be sent to email after the cleaning is completed',
                style: TextStyle(
                fontSize: 14,
                fontFamily: AppFont.heavy,
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),),
            ),
          ],
        )
      ],
    );
  }
}

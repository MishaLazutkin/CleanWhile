import 'package:clean_whale/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../utils/style.dart';
import '../../widgets/all.dart';

class DefaultTab extends StatefulWidget {
  const DefaultTab({Key? key}) : super(key: key);

  @override
  State<DefaultTab> createState() => _DefaultTabState();
}

class _DefaultTabState extends State<DefaultTab>
    with FullscreenLoaderMixin<DefaultTab> {
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

  final FocusNode _invoiceNameNode = FocusNode();
  final FocusNode _invoiceNipNode = FocusNode();
  final FocusNode _invoiceAddressNode = FocusNode();
  final FocusNode _invoicePostalCodeNode = FocusNode();

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
  final FocusNode _additionalInfoNode = FocusNode();
  final FocusNode _promocodeNode = FocusNode();
  final FocusNode _refferalNode = FocusNode();
  final FocusNode _beforeNode = FocusNode();
  final FocusNode _afterNode = FocusNode();
  var keyDate = GlobalKey();
  var keyTime = GlobalKey();
  var keyStreet = GlobalKey();
  var keyHouseNumber = GlobalKey();
  var keyPhoneNumber = GlobalKey();

  var keyContract = GlobalKey();

  bool showDateError = false;
  bool showTimeError = false;
  bool showStreetError = false;
  bool showHouseNumberError = false;
  bool showContractError = false;
  bool showPhoneError = false;
  bool showEmailError = false;

  late DefaultOrderProvider _createOrderProvider;
  late HomeProvider _homeProvider;
  late ProfileProvider _profileProvider;
  late InfoProvider _infoProvider;

  @override
  void initState() {
    super.initState();
    _initProviders();
  }

  _initProviders() async {
    _createOrderProvider = context.read<DefaultOrderProvider>();
    _homeProvider = context.read<HomeProvider>();
    _profileProvider = context.read<ProfileProvider>();
    _infoProvider = context.read<InfoProvider>();
    runWithLoader(() async {
      await _createOrderProvider.init();
      await _homeProvider.init();
      _profileProvider.init();
      _infoProvider.init();
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
              _yourFlatSection(),
              const SizedBox(
                height: 68,
              ),
              _selectDateTimeSection(),
              const SizedBox(
                height: 65,
              ),
              _advertisement(),
              const SizedBox(
                height: 20,
              ),
              _cleanerOptionsSection(),
              const SizedBox(
                height: 20,
              ),
              _dryCleanerSection(),
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
              const SizedBox(
                height: 6,
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
              Consumer<DefaultOrderProvider>(
                builder: (context, provider, child) {
                  return CustomButton(
                    text: 'Замовити за  149.90 zł',
                    onTap: () {
                      if(validate(provider))
                        sendOrder();

                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        if (showLoader) const FullscreenLoader(showGrayBackground: true,),
      ],
    );
  }

  bool validate(DefaultOrderProvider provider) {
    if (!isValidDate(provider)) {
      Scrollable.ensureVisible(keyDate.currentContext!,
          duration: Duration(seconds: 2));
    } else if (!isValidTime(provider)) {
      Scrollable.ensureVisible(keyTime.currentContext!,
          duration: Duration(seconds: 2));
    } else if (!isValidStreet(provider)) {
      Scrollable.ensureVisible(keyStreet.currentContext!,
          duration: Duration(seconds: 2));
    } else if (!isValidHouseNumber(provider)) {
      Scrollable.ensureVisible(keyStreet.currentContext!,
          duration: Duration(seconds: 2));
    } else if (!isValidPhone(provider)) {
      Scrollable.ensureVisible(keyPhoneNumber.currentContext!,
          duration: Duration(seconds: 2));
    } else if (!isValidEmail(provider)) {
      Scrollable.ensureVisible(keyPhoneNumber.currentContext!,
          duration: Duration(seconds: 2));
    } else if (!isValidContract(provider)) {
      Scrollable.ensureVisible(keyContract.currentContext!,
          duration: Duration(seconds: 2));
    }
    return isValidDate(provider) &&
        isValidTime(provider) &&
        isValidStreet(provider) &&
        isValidHouseNumber(provider) &&
        isValidContract(provider) &&
        isValidPhone(provider) &&
        isValidEmail(provider);
  }


  void sendOrder(){
    _createOrderProvider.isSelectedPublicContract;
  }

  bool isValidDate(DefaultOrderProvider provider) {
    bool isValid = provider.selectedDate != null;
    setState(() {
      if (isValid) {
        showDateError = false;
      } else {
        showDateError = true;
      }
    });
    return isValid;
  }

  bool isValidTime(DefaultOrderProvider provider) {
    bool isValid = provider.selectedTime.isNotEmpty ||
        (provider.selectedClarifications[0] == true) ||
        (provider.selectedClarifications[1] == true);

    setState(() {
      if (isValid) {
        showTimeError = false;
      } else {
        showTimeError = true;
      }
    });
    return isValid;
  }

  bool isValidStreet(DefaultOrderProvider provider) {
    bool isValid = provider.street.isNotEmpty;
    setState(() {
      if (isValid) {
        showStreetError = false;
      } else {
        showStreetError = true;
      }
    });
    return isValid;
  }

  bool isValidHouseNumber(DefaultOrderProvider provider) {
    bool isValid = provider.houseNumber.isNotEmpty;
    setState(() {
      if (isValid) {
        showHouseNumberError = false;
      } else {
        showHouseNumberError = true;
      }
    });
    return isValid;
  }

  bool isValidContract(DefaultOrderProvider provider) {
    bool isValid = provider.isSelectedPublicContract;
    setState(() {
      if (isValid) {
        showContractError = false;
      } else {
        showContractError = true;
      }
    });
    return isValid;
  }

  bool isValidPhone(DefaultOrderProvider provider) {
    bool isValid = provider.phoneNumber.isNotEmpty;
    setState(() {
      if (isValid) {
        showPhoneError = false;
      } else {
        showPhoneError = true;
      }
    });
    return isValid;
  }

  bool isValidEmail(DefaultOrderProvider provider) {
    bool isValid = provider.email.isNotEmpty;
    setState(() {
      if (isValid) {
        showEmailError = false;
      } else {
        showEmailError = true;
      }
    });
    return isValid;
  }

  Widget _personsButtons() {
    return Consumer<DefaultOrderProvider>(
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

  Widget _yourFlatSection() {
    return Column(
      children: [
        Consumer<DefaultOrderProvider>(
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
    return Consumer<DefaultOrderProvider>(
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

  Widget _selectDateTimeSection() {
    return Consumer<DefaultOrderProvider>(
      builder: (context, provider, child) {
        return DateTimeSection(
          key: keyDate,
          selectedClarifications: provider.selectedClarifications,
          listTimes: provider.listTimes,
          onPressedClarButton: (index) {
            // The button that is tapped is set to true, and the others to false.
            for (int i = 0; i < provider.selectedClarifications.length; i++) {
              provider.selectedClarifications[i] = i == index;
            }
            provider.selectedTime = '';
            isValidTime(provider);
          },
          onPressedTimeButton: (index, value) {
            provider.listTimes[index]['time'] = value;
            provider.selectedTime = value;
            provider.selectedClarifications = [false, false];
            provider.groupButtonController.unselectAll();
            isValidTime(provider);
          },
          selectedTime: provider.selectedTime,
          controller: provider.groupButtonController,
          onSelectDate: (date) {
            provider.selectedDate = date;
            isValidDate(provider);
          },
          timeKey: keyTime,
          showDateError: showDateError,
          showTimeError: showTimeError,
        );
      },
    );
  }

  Widget _advertisement() {
    return Consumer<DefaultOrderProvider>(
      builder: (context, provider, child) {
        return DiscountSection(
          selectedDiscountId: provider.selectedDiscountId,
          discountDataList: provider.discountDataList,
          onTap: (index) {
            provider.selectedDiscountId =
                provider.discountDataList[index]['id'];
          },
        );
      },
    );
  }

  Widget _cleanerOptionsSection() {
    return Column(
      children: [
        const TitleSecondary(title: 'Оберіть опції для вашого прибирання'),
        const SizedBox(
          height: 16,
        ),
        Consumer<DefaultOrderProvider>(
          builder: (context, provider, child) {
            return CustomGridView(
              padding: const EdgeInsets.only(top: 10),
              listWidget: provider.cleanerOptionsList(),
              onTap: (index) {
                provider.selectionsCleanOptions[index] =
                    !provider.selectionsCleanOptions[index];
                setState(() {});
              },
            );
          },
        ),
        const SizedBox(
          height: 60,
        ),
        const TitleSecondary(title: 'Додаткові опції '),
        const SizedBox(
          height: 19,
        ),
        _vacuumCleanerSection(),
      ],
    );
  }

  Widget _dryCleanerSection() {
    return Column(
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
    );
  }

  Widget _vacuumCleanerSection() {
    return Consumer<DefaultOrderProvider>(
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
    return Consumer<DefaultOrderProvider>(
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

  Widget _contactsSection() {
    return Consumer<DefaultOrderProvider>(
      builder: (context, provider, child) {
        return ContactsSection(
          key: keyPhoneNumber,
          name: _name,
          phone: _phoneNumber,
          email: _email,
          additionalInfo: _additionalInfo,
          nameNode: _nameNode,
          phoneNumberNode: _phoneNumberNode,
          emailNode: _emailNode,
          additionalInfoNode: _additionalInfoNode,
          showPhoneError: showPhoneError,
          showEmailError: showEmailError,
          onNameTyping: (x) => provider.name = x,
          onPhoneTyping: (x) {
            provider.phoneNumber = x;
            isValidPhone(provider);
          },
          onEmailTyping: (x) {
            provider.email = x;
            isValidEmail(provider);
          },
          onAdditionalInfoTyping: (x) => provider.additionalInfo = x,
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
        Consumer<DefaultOrderProvider>(
          builder: (context, provider, child) {
            return AdressSection(
              key: keyStreet,
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
                isValidStreet(provider);
              },
              onPostalCodeTyping: (x) {
                provider.postalCode = x;
              },
              onNumbHouseTyping: (x) {
                provider.houseNumber = x;
                isValidHouseNumber(provider);
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
              showErrorStreet: showStreetError,
              showErrorHouseNumber: showHouseNumberError,
            );
          },
        ),
      ],
    );
  }

  Widget _invoiceSection() {
    return Consumer<DefaultOrderProvider>(
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
    return Consumer<DefaultOrderProvider>(
      builder: (context, provider, child) {
        return ContractPersonalSection(
          key: keyContract,
          isSelectedPublicContract: provider.isSelectedPublicContract,
          isSelectedUsePersonalData: provider.isSelectedUsePersonalData,
          onCheckContract: (value) {
            provider.isSelectedPublicContract = value;
            isValidContract(provider);
          },
          onCheckPersonalData: (value) {
            provider.isSelectedUsePersonalData = value;
          },
          showContractError: showContractError,
        );
      },
    );
  }

  Widget _textOrderInfo() {
    return Container(
      width: double.infinity,
      color: AppColor.textFieldFill,
      child: const Padding(
        padding:
            const EdgeInsets.only(top: 18.0, right: 18, bottom: 18, left: 22),
        child: Center(
          child: Text(
            'Прибирання квартири з 1 житловою та 1 ванною кімнатою, кухня, коридор 149.90 zł ',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _textDataInfo() {
    return RichText(
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
    );
  }

  Widget _promocodeSection() {
    return Consumer<DefaultOrderProvider>(
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
    return Consumer<DefaultOrderProvider>(
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
}

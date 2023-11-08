import 'package:clean_whale/widgets/all.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../utils/style.dart';
import 'custom_dropdown.dart';

class ContactsSection extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController additionalInfo;
  final FocusNode nameNode;
  final FocusNode phoneNumberNode;
  final FocusNode emailNode;
  final FocusNode additionalInfoNode;


  final Function onNameTyping;
  final Function onPhoneTyping;
  final Function onEmailTyping;
  final Function onAdditionalInfoTyping;
  final bool showPhoneError;
  final bool showEmailError;

  ContactsSection({
    Key? key,
    required this.onNameTyping,
    required this.onPhoneTyping,
    required this.onEmailTyping,
    required this.onAdditionalInfoTyping,
    this.showPhoneError = false,
    this.showEmailError = false,
    required this.name,
    required this.phone,
    required this.email,
    required this.additionalInfo,
    required this.nameNode,
    required this.phoneNumberNode,
    required this.emailNode,
    required this.additionalInfoNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSecondary(title: 'Контактні дані'),
        const SizedBox(
          height: 20,
        ),
        _contactsForm(),
      ],
    );
  }

  Widget _contactsForm() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode:  nameNode,
                  controller:  name,
                  labelText: 'Ваше ім\'я',
                  onTyping: (x) {
                    onNameTyping(x);
                  }),
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
                showError: showPhoneError,
                focusNode:  phoneNumberNode,
                controller:  phone,
                leftPadding: 100,
                keyboardType: TextInputType.phone,
                contentPadding: const EdgeInsets.only(
                    left: 120, top: 8, bottom: 8, right: 16),
                labelText: 'Контактний телефон',
                onTyping: (x) {
                  onPhoneTyping(x);
                }),
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
                  showError: showEmailError,
                  focusNode: emailNode,
                  controller:  email,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'E-mail адреса',
                  onTyping: (x) {
                    onEmailTyping(x);
                  }),
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
                  focusNode: additionalInfoNode,
                  controller:  additionalInfo,
                  textFieldHeight: 124,
                  labelText: 'Додаткова інформація про замовлення',
                  onTyping: (x) {
                    onAdditionalInfoTyping(x);
                  }),
            ),
          ],
        ),
      ],
    );
  }
}

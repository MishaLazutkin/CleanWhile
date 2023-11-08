import 'package:clean_whale/widgets/all.dart';
import 'package:clean_whale/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/style.dart';
import '../../widgets/custom_appbar.dart';

class EditOrderPage extends StatefulWidget {
  const EditOrderPage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditOrderPage> createState() => _EditOrderPageState();
}

class _EditOrderPageState extends State<EditOrderPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _phoneNumberNode = FocusNode();
  final FocusNode _emailNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 40,
              ),
              _title(),
              const SizedBox(
                height: 25,
              ),
              _formData(),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Зберегти',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:   CustomBottomBar( 4),
    );
  }

  Widget _title() {
    return const TitleSecondary(title: 'Редагувати запис');
  }

  Widget _formData() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode: _nameNode,
                  controller: _name,
                  fillColor: const Color.fromRGBO(255, 255, 255, 1),
                  enabledBorderColor: const Color.fromRGBO(229, 229, 229, 1),
                  focusedBorderColor: const Color.fromRGBO(229, 229, 229, 1),
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
                fillColor: const Color.fromRGBO(255, 255, 255, 1),
                enabledBorderColor: const Color.fromRGBO(229, 229, 229, 1),
                focusedBorderColor: const Color.fromRGBO(229, 229, 229, 1),
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
                  fillColor: const Color.fromRGBO(255, 255, 255, 1),
                  enabledBorderColor: const Color.fromRGBO(229, 229, 229, 1),
                  focusedBorderColor: const Color.fromRGBO(229, 229, 229, 1),
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'E-mail адреса',
                  onTyping: () {}),
            ),
          ],
        ),
      ],
    );
  }
}

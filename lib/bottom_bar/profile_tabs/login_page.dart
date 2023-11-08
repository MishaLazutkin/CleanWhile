import 'package:clean_whale/bottom_bar/profile_tabs/home_page.dart';
import 'package:clean_whale/providers/default_order_provider.dart';
import 'package:clean_whale/utils/app_helper.dart';
import 'package:clean_whale/utils/style.dart';
import 'package:clean_whale/widgets/all.dart';
import 'package:clean_whale/widgets/header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../handyman_subcat_page.dart';
import '../../menu.dart';
import '../../providers/profile_provider.dart';
import '../../public_contract.dart';
import '../../services/navigation_service/navigation_service.dart';
import '../../widgets/custom_bottom_bar.dart';
class LoginPage extends StatefulWidget {

  const LoginPage({Key? key,  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  bool isCodeSended = false;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColor.backgroundPage,
      appBar: CustomHeader(

      ),
      endDrawer: DrawerMenu(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              _image(),
              const SizedBox(
                height: 63,
              ),
              _title(),
              const SizedBox(
                height: 30,
              ),
              _enterEmailField(),
              const SizedBox(
                height: 20,
              ),
              _enterCodeField(),
              const SizedBox(
                height: 35,
              ),
              _getCodeButton(padding),
              const SizedBox(
                height: 29,
              ),
              _loginRules(),
              const SizedBox(
                height: 37,
              ),
              _publicContract(),
              const SizedBox(
                height: 50,
              ),
              _loginSocialSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar:   CustomBottomBar( 4),
    );
  }

  Widget _image() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'lib/assets/icons/profile.svg',
          height: 137,
        ),
      ],
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Flexible(
          child: Text('Увійти або створити профіль',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: AppFont.heavy,
                  color: Color.fromRGBO(43, 43, 43, 1))),
        ),
      ],
    );
  }

  Widget _enterEmailField() {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return CustomTextField(
          textFieldHeight: 50,
          enabledBorderColor: const Color.fromRGBO(229, 229, 229, 1),
          fillColor: const Color.fromRGBO(253, 253, 253, 1),
          labelStyle: AppTextStyle.profileLabelStyle,
          keyboardType: TextInputType.emailAddress,
          labelText: 'Введіть Вашу електронну адресу',
          hintText: 'Введіть E-mail',
          hintStyle: AppTextStyle.profileHintStyle,
          focusNode: _emailNode,
          controller: _email,
          onTyping: (x) {},
        );
      },
    );
  }

  Widget _enterCodeField() {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Visibility(
          visible: isCodeSended,
          child: CustomTextField(
            textFieldHeight: 50,
            enabledBorderColor: const Color.fromRGBO(229, 229, 229, 1),
            fillColor: const Color.fromRGBO(253, 253, 253, 1),
            labelStyle: AppTextStyle.profileLabelStyle,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Код для входу',
            //hintText: 'Код для входу',
            hintStyle: AppTextStyle.profileHintStyle,
            focusNode: _emailNode,
            controller: _email,
            onTyping: (x) {},
          ),
        );
      },
    );
  }

  Widget _getCodeButton(double padding) {
    if (!isCodeSended) {
      return CustomButton(
          height: 60,
          text: 'Отримати код',
          onTap: () {
            setState(() {
              isCodeSended = true;
            });
          });
    } else {
      return CustomButton(
          height: 60,
          text: 'Увiйти',
          onTap: () {
            NavigationService().push(context, const ProfileHomePage( ));
          });
    }
  }

  Widget _loginRules() {
    return const Text(
      'Обліковий запис буде прив’язаний до вашої електронної адреси. Кожного разу, коли ви будете отримувати унікальний код, за допомогою якого ви зможете ввійти в систему. Перший раз, коли ви введете тут свою електронну адресу, ви потрапите на сторінку реєстрації. Ви будете входити у свій акаунт кожного разу.               ',
      style: TextStyle(
          fontSize: 14,
          fontFamily: AppFont.heavy,
          fontWeight: FontWeight.w300,
          color: Color.fromRGBO(0, 0, 0, 1)),
    );
  }

  Widget _publicContract() {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Row(
          children: [
            SvgPicture.asset(
              'lib/assets/icons/vector2.svg',
              color: const Color.fromRGBO(0, 0, 0, 1),
            ),
            const SizedBox(
              width: 11,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Згоден з договором ',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.heavy,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                    TextSpan(
                      text: 'публічної оферти',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          NavigationService().push(context, const PublicContract( ));
                        },
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.heavy,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                          decoration: TextDecoration.underline), //<-- SEE HERE
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _loginSocialSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(
              child: Text('Увійти за допомогою',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(119, 119, 119, 1))),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        AppHelper.loginSocialButton(
            context: context,
            uriPic: 'lib/assets/icons/login_google.png',
            title: 'Continue with Google',
            onTap: () {}),
        const SizedBox(
          height: 20,
        ),
        AppHelper.loginSocialButton(
            context: context,
            uriPic: 'lib/assets/icons/login_facebook.png',
            title: 'Continue with Facebook',
            onTap: () {}),
        const SizedBox(
          height: 20,
        ),
        AppHelper.loginSocialButton(
            context: context,
            uriPic: 'lib/assets/icons/login_apple.png',
            title: 'Continue with Apple',
            onTap: () {}),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

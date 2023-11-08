import 'package:clean_whale/utils/style.dart';
import 'package:clean_whale/widgets/all.dart';
import 'package:clean_whale/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../providers/profile_provider.dart';
import '../../services/navigation_service/navigation_service.dart';
import '../../widgets/accept_dialog.dart';
import 'add_adress_page.dart';
import 'edit_adress_page.dart';

class AdressesTab extends StatelessWidget {
  const AdressesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _listAdresses();
  }

  Widget _listAdresses() {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.listAdresses.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: provider.listAdresses[index]
                                        ['isRemovable']
                                    ? const Color.fromRGBO(247, 247, 247, 1)
                                    : const Color.fromRGBO(213, 249, 255, 1),
                                borderRadius: BorderRadius.circular(
                                    AppValues.regularCornerRadius)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 19),
                              child: Column(
                                children: [
                                  Text(
                                    '${provider.listAdresses[index]['title']}',
                                    style: const TextStyle(
                                        color: Color.fromRGBO(43, 43, 43, 1),
                                        fontFamily: AppFont.heavy,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 29,
                                  ),
                                  _bottomElements(
                                      context, provider.listAdresses[index])
                                ],
                              ),
                            ),
                          ),
                          if (index + 1 == provider.listAdresses.length)
                            _bottomButton(context)
                        ],
                      ),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }

  Widget _bottomElements(BuildContext context, Map<String, dynamic> adress) {
    if (adress['isDefault']) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: _editButton(context)),
          const SizedBox(
            width: 25,
          ),
          const Flexible(child: Text('( Адреса за замовчуванням )'))
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(flex: 4, child: _makeDefaultButton()),
          Flexible(flex: 4, child: _editButton(context)),
          Flexible(flex: 2, child: _deleteButton(context))
        ],
      );
    }
  }

  Widget _editButton(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService().push(context, const EditAdress());
      },
      child: Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.regularCornerRadius),
            color: const Color.fromRGBO(255, 199, 59, 1),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'lib/assets/icons/settings 1.svg',
                height: 18,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text('Редагувати',
                      style: TextStyle(
                          color: Color.fromRGBO(43, 43, 43, 1),
                          fontFamily: AppFont.heavy,
                          fontWeight: FontWeight.w400,
                          fontSize: 14)),
                ),
              ),
            ],
          )),
    );
  }

  Widget _makeDefaultButton() {
    return Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppValues.regularCornerRadius),
          color: const Color.fromRGBO(204, 240, 245, 1),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'lib/assets/icons/pin 2.svg',
              height: 18,
              color: const Color.fromRGBO(0, 0, 0, 1),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Make Default',
                    style: TextStyle(
                        color: Color.fromRGBO(43, 43, 43, 1),
                        fontFamily: AppFont.heavy,
                        fontWeight: FontWeight.w400,
                        fontSize: 14)),
              ),
            ),
          ],
        ));
  }

  Widget _deleteButton(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actionsPadding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.close))
                  ],
                ),
                content: const Text("Ви впевнені?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        fontFamily: AppFont.heavy,
                        color: Color.fromRGBO(0, 0, 0, 1))),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(125, 196, 193, 1),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Так',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  fontFamily: AppFont.heavy,
                                  color: Colors.white)),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(233, 135, 132, 1),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Ні',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                fontFamily: AppFont.heavy,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            });
      },
      child: Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.regularCornerRadius),
            color: const Color.fromRGBO(255, 199, 59, 1),
          ),
          child: SvgPicture.asset(
            'lib/assets/icons/trash-bin 1.svg',
            height: 18,
            color: const Color.fromRGBO(0, 0, 0, 1),
          )),
    );
  }

  Widget _bottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: CustomButton(
          cornerRadius: 10,
          height: 68,
          textStyle: const TextStyle(
              color: Color.fromRGBO(43, 43, 43, 1),
              fontFamily: AppFont.heavy,
              fontWeight: FontWeight.w500,
              fontSize: 18),
          enabledColor: const Color.fromRGBO(89, 183, 139, 1),
          leading: SvgPicture.asset('lib/assets/icons/plus.svg'),
          text: 'Додати новий адрес',
          onTap: () {
            NavigationService().push(context, const AddAdress());

          }),
    );
  }
}

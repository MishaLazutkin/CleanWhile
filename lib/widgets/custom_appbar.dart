import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: const Color.fromRGBO(218, 218, 218, 1),
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back_ios),
          //replace with our own icon data.
        ),
        actions: [

          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              'lib/assets/icons/menu.svg',
              width: 22,
              height: 22,
            ),
          ),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

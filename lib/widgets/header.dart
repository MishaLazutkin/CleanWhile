import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/style.dart';

class CustomHeader extends StatelessWidget with PreferredSizeWidget {


  CustomHeader({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.backgroundPage,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      actions: [Container()],
      title: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'lib/assets/icons/clean_whale.svg',
              height: 35,
            ),
            const Spacer(),
            Builder(
              builder: (context) => InkWell(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: SvgPicture.asset(
                  'lib/assets/icons/menu.svg',
                  width: 22,
                  height: 22,
                ),
              ),
            ),
          ],
        ),
      ),

      // bottom: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: Padding(
      //     padding: EdgeInsets.only(left: 16, right: 16,top: kToolbarHeight),
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         SvgPicture.asset(
      //           'lib/assets/icons/clean_whale.svg',
      //           height: 35,
      //         ),
      //         const Spacer(),
      //         Builder(
      //           builder: (context) =>
      //               InkWell(
      //             onTap: () {
      //
      //               Scaffold.of(context).openEndDrawer();
      //             },
      //             child: SvgPicture.asset(
      //               'lib/assets/icons/menu.svg',
      //               width: 22,
      //               height: 22,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

//+ MediaQuery.of(context).padding.top
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

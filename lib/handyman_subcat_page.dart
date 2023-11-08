import 'package:clean_whale/utils/style.dart';
import 'package:flutter/material.dart';
import 'widgets/all.dart';

class HandymanSubcategory extends StatefulWidget {
  final List<Widget> listServices;
  final String title;
  final String worker;

  const HandymanSubcategory(
      {Key? key,
      required this.listServices,
      required this.title,
      required this.worker})
      : super(key: key);

  @override
  State<HandymanSubcategory> createState() => _HandymanSubcategoryState();
}

class _HandymanSubcategoryState extends State<HandymanSubcategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      endDrawer: DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  _title(widget.title),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(child: _listServices(widget.listServices)),
                ],
              ),
            ),
            CustomButton(
              text: 'Замовити ${widget.worker}  у Києві',
              onTap: () {},
            )
          ],
        ),
      ),
      bottomNavigationBar:   CustomBottomBar( 2),
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          fontFamily: AppFont.heavy,
          color: Color.fromRGBO(43, 43, 43, 1)),
    );
  }

  Widget _listServices(List<Widget> listServices) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: CustomGridView(
          crossAxisCount: 3,
          padding: const EdgeInsets.only(top: 10),
          listWidget: listServices,
          onTap: (index) {},
        ),
      ),
    );
  }
}

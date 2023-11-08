import 'package:clean_whale/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../handyman_subcat_page.dart';
import '../services/navigation_service/navigation_service.dart';
import '../widgets/all.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({
    Key? key,
  }) : super(key: key);

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab>  with FullscreenLoaderMixin<ServicesTab> {

  final List<Map<String, dynamic>> _expansionTitlesList = [
    {
      'title': 'Додаткові послуги',
      'uriPicture': 'lib/assets/icons/clean_flat.svg',
      'isSingle': true,
    },
    {
      'title': 'Хімчістка',
      'uriPicture': 'lib/assets/icons/dry-order.svg',
      'isSingle': true,
    },
    {
      'title': 'Прибирання після ремонту',
      'uriPicture': 'lib/assets/icons/repair-order.svg',
      'isSingle': true,
    },
    {
      'title': 'Миття вікон',
      'uriPicture': 'lib/assets/icons/window-order.svg',
      'isSingle': false,
    },
    {
      'title': 'Чоловік на годину',
      'uriPicture': 'lib/assets/icons/handyman-order.svg',
      'isSingle': false,
    },
  ];
  final List<Map<String, dynamic>> dataList = [
    {
      'title': 'Прибирання квартири',
      'uriPicture': 'lib/assets/icons/clean_flat.svg',
      'isSingle': true,
    },
    {
      'title': 'Прибирання після ремонту',
      'uriPicture': 'lib/assets/icons/repair-order.svg',
      'isSingle': true,
    },
    {
      'title': 'Миття вікон',
      'uriPicture': 'lib/assets/icons/window-order.svg',
      'isSingle': true,
    },
    {
      'title': 'Хімчистка меблів та диванів',
      'uriPicture': 'lib/assets/icons/dry-order.svg',
      'isSingle': true,
    },
    {
      'title': 'Прибирання кухні',
      'uriPicture': 'lib/assets/icons/kitchen-order.svg',
      'isSingle': true,
    },
    {
      'title': 'Прибирання в офісах',
      'uriPicture': 'lib/assets/icons/office-order.svg',
      'isSingle': true,
    },
  ];

  late DefaultOrderProvider _createOrderProvider;
  late HomeProvider _homeProvider;
  late ProfileProvider _profileProvider;
  late InfoProvider _infoProvider;


  List<Widget> widgetList() {
    return List.generate(
        dataList.length,
        (index) => MainService(
              image: SvgPicture.asset(dataList[index]['uriPicture']),
              title: dataList[index]['title'],
              backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
              textColor: Colors.black,
            ));
  }


  @override
  void initState() {
    super.initState();
     _initProviders();

  }

  _initProviders() async{
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
      children: [
        Scaffold(
          backgroundColor: AppColor.backgroundPage,
          appBar: CustomHeader(),
          endDrawer: DrawerMenu(),
          body: Consumer<DefaultOrderProvider>(
              builder: (context, provider, child) {

                final List<List<Widget>> _expansionWidgetsList = [
                  provider.cleanerOptionsList(),
                  provider.dryCleanerList(),
                  provider.repairCleanerOptionsList(),
                  provider.windowCleanerOptionsList(),
                  provider.handyManCleanerOptionsList(),
                ];

                return Container(
                  color: AppColor.backgroundPage,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: AppValues.headerMarginTop,
                            ),
                            _title(),
                            const SizedBox(
                              height: 24,
                            ),
                            CustomGridView(
                                padding: const EdgeInsets.only(top: 10),
                                crossAxisCount: 3,
                                listWidget: widgetList(),

                            ),
                            const SizedBox(
                              height: 58,
                            ),
                            _additionalOptions(_expansionWidgetsList)
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          bottomNavigationBar:   CustomBottomBar(0),
        ),

        if (showLoader)
          const FullscreenLoader(
            showGrayBackground: true,
          ),
      ],
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Послуги',
          style: AppTextStyle.titleBlackBig,
        )
      ],
    );
  }

  Widget _additionalOptions(final List<List<Widget>> expansionWidgetsList) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(AppValues.regularCornerRadius),
                color: AppColor.expansionTile,
              ),
              child: ExpansionTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                collapsedBackgroundColor: AppColor.containersBackgroundColor,
                onExpansionChanged:(value){
                  if(!_createOrderProvider.isInited) _initProviders();
                },
                leading: SvgPicture.asset(
                  _expansionTitlesList[index]['uriPicture'],
                  width: 10,
                  height: 20,
                ),
                title: Text(
                  _expansionTitlesList[index]['title'],
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFont.heavy,
                      color: Color.fromRGBO(43, 43, 43, 1)),
                ),
                iconColor: Color.fromRGBO(119, 119, 119, 1),
                children: [
                  if (index == 4) ...[_gridVie2w()],
                  _gridView(expansionWidgetsList[index])
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _gridVie2w() {
    return Consumer<DefaultOrderProvider>(
      builder: (context, provider, child) {
        return CustomGridView(
          backgroundColor: Colors.white,
          padding: EdgeInsets.only(top: 10),
          listWidget: provider.categoriesList,
          onTap: (index) {
            _navigateTo(index, provider);
          },
        );
      },
    );
  }

  Widget _gridView(List<Widget> listWidget) {
    return CustomGridView(
      backgroundColor: Colors.white,
      padding: const EdgeInsets.only(top: 10),
      crossAxisCount: 3,

      listWidget: listWidget,
      onTap: (index) {},
    );
  }


  _navigateTo(int index, DefaultOrderProvider provider) {
    switch (index) {
      case 0:
        NavigationService().push(context,   HandymanSubcategory(
          title: 'Електротехнічні послуги',
          worker: 'електрика',
          listServices:
          provider.handyManCleanerOptionsSubList('electric'),
        ));
        break;
      case 1:
        NavigationService().push(context,HandymanSubcategory(
          title: 'Столярні послуги',
          worker: 'послуги столяра',
          listServices:
          provider.handyManCleanerOptionsSubList('carpenter'),
        ));
        break;
      case 2:
        NavigationService().push(context,HandymanSubcategory(
          title: 'Слюсарні послуги',
          worker: 'послуги слюсара',
          listServices:
          provider.handyManCleanerOptionsSubList('locksmith'),
        ));
        break;
      case 3:
        NavigationService().push(context,HandymanSubcategory(
          title: 'Сантехнічні послуги',
          worker: 'послуги сантехніка',
          listServices:
          provider.handyManCleanerOptionsSubList('plumber'),
        ));
        break;
      default:
        break;
    }
  }
}

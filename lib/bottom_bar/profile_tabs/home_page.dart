import 'package:clean_whale/menu.dart';
import 'package:clean_whale/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../providers/profile_provider.dart';
import '../../utils/style.dart';
import '../../widgets/divider_with_title.dart';
import '../../widgets/fullscreen_loader.dart';
import '../../widgets/header.dart';
import 'adresses_tab.dart';
import 'cards_tab.dart';
import 'orders_tab.dart';
import 'profile_tab.dart';
import 'referral_tab.dart';

class ProfileHomePage extends StatefulWidget {

  const ProfileHomePage({Key? key,  }) : super(key: key);

  @override
  State<ProfileHomePage> createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage>
    with FullscreenLoaderMixin<ProfileHomePage>, TickerProviderStateMixin {
  late TabController _tabController;
  late int _currentTabIndex = 0;
  late ProfileProvider _profileProvider;


  _initProvider() async {
    _profileProvider = context.read<ProfileProvider>();
    runWithLoader(() async {
      await _profileProvider.init();
    });
  }

  @override
  void initState() {
    super.initState();
    _initTabController();
    _initProvider();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: AppColor.backgroundPage,
            appBar: CustomHeader(

            ),
            endDrawer: DrawerMenu(),
            body: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      //_header(padding),
                      const SizedBox(
                        height: 23,
                      ),
                      _divider(),
                      const SizedBox(
                        height: 21,
                      ),
                      _tabs(),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _defaultTab(),
                        _ordersTab(),
                        _adressesTab(),
                        _cardsTab(),
                        _referalProgramTab(),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar:   CustomBottomBar( 4),
          );
        }));
  }

  Widget _defaultTab() {
    return   const ProfileTab();
  }


  Widget _ordersTab() {
    return    const OrdersTab();
  }

  Widget _adressesTab() {
    return   const AdressesTab();
  }

  Widget _cardsTab() {
    return   const CardsTab();
  }

  Widget _referalProgramTab() {
    return   const ReferralTab();
  }




  Widget _tabs() {
    return Container(

      child: Material(

        child: TabBar(

          labelPadding: const EdgeInsets.all(0.0),
          controller: _tabController,
          isScrollable: false,
          labelColor: AppColor.tabSelectedBackgroundColor,
          unselectedLabelColor: AppColor.containersBackgroundColor,

          indicator: BoxDecoration(
              color: AppColor.profileTabSelectedBackgroundColor,

              borderRadius: BorderRadius.circular(6)),
          tabs: [
            _individualTab('Мій аккаунт', 'lib/assets/icons/user 1.svg'),
            _individualTab('Мої замовлення', 'lib/assets/icons/listing 1.svg'),
            _individualTab('Збережені адреси', 'lib/assets/icons/home 1.svg'),
            _individualTab('Збережені картки', 'lib/assets/icons/cards 1.svg'),
            _individualTab(
                'Реферальна програма', 'lib/assets/icons/share 1.svg'),

          ],
        ),
      ),
    );
  }

  Widget _individualTab(String title, String urlIcon) {

    return Container(
      //color: AppColor.tabUnSelectedLabelColor,
      child: Column(
        children: [
          const SizedBox(
            height: 9.43,
          ),
          SvgPicture.asset(
            urlIcon,
            height: 25,
          ),
          const SizedBox(
            height: 9.43,
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.labelProfileTabs,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 9.43,
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const DividerTitle(title: 'Вибiр послуг');
  }


  void _initTabController() {
    _tabController = TabController(vsync: this, length: 5)
      ..addListener(() {
        setState(() {
          _currentTabIndex = _tabController.index;
          switch (_tabController.index) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
          }
        });
      });
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../services/navigation_service/navigation_service.dart';
import '../../utils/style.dart';
import '../../widgets/all.dart';

class CreateOrderTab extends StatefulWidget {
  const CreateOrderTab({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateOrderTab> createState() => _CreateOrderTabState();
}

class _CreateOrderTabState extends State<CreateOrderTab>
    with FullscreenLoaderMixin<CreateOrderTab>, TickerProviderStateMixin {
  late TabController _tabController;
  late int _currentTabIndex = 0;
  late DefaultOrderProvider _createOrderProvider;
  final NavigationService _navigationService = NavigationService();

  _initProvider() async {
    _createOrderProvider = context.read<DefaultOrderProvider>();
    runWithLoader(() async {
      await _createOrderProvider.init();
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
        length: 10,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: AppColor.backgroundPage,
            appBar: CustomHeader(),
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
                      _divider(),
                      const SizedBox(
                        height: 15,
                      ),
                      _tabs(),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      physics: _navigationService.isOffline() == true
                          ? NeverScrollableScrollPhysics()
                          : ScrollPhysics(),
                      children: [
                        _defaultTab(),
                        _repairTab(),
                        _windowTab(),
                        _dryCleanerTab(),
                        _handymanTab(),
                        _officeTab(),
                        _carsTab(),
                        _privateHouseTab(),
                        _kitchenTab(),
                        _presentTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomBar(2),
          );
        }));
  }

  Widget _defaultTab() {
    return const DefaultTab();
  }

  Widget _repairTab() {
    return const RepairTab();
  }

  Widget _windowTab() {
    return const WindowsTab();
  }

  Widget _dryCleanerTab() {
    return const DryCleaneTab();
  }

  Widget _handymanTab() {
    return const HandyManTab();
  }

  Widget _officeTab() {
    return const OfficeTab();
  }

  Widget _carsTab() {
    return const CarsTab();
  }

  Widget _privateHouseTab() {
    return const PrivateHouseTab();
  }

  Widget _kitchenTab() {
    return const KitchenTab();
  }

  Widget _presentTab() {
    return PresentTab();
  }

  Widget _tabs() {
    return Container(
      height: 65,
      child: Material(
        child: TabBar(
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          isScrollable: true,
          labelColor: AppColor.tabSelectedBackgroundColor,
          unselectedLabelColor: AppColor.containersBackgroundColor,
          indicator: BoxDecoration(
              color: AppColor.tabSelectedBackgroundColor,
              borderRadius: BorderRadius.circular(6)),
          tabs: [
            _individualTab('Звичайне', 'lib/assets/icons/default-order.svg'),
            _individualTab('Ремонт', 'lib/assets/icons/repair-order.svg'),
            _individualTab('Миття вiкон', 'lib/assets/icons/window-order.svg'),
            _individualTab('Хiмчистка', 'lib/assets/icons/sofa-order.svg'),
            _individualTab(
                'Чоловiк на годину', 'lib/assets/icons/handyman-order.svg'),
            _individualTab('Офiс', 'lib/assets/icons/office-order.svg'),
            _individualTab('Cars', 'lib/assets/icons/car-order.svg'),
            _individualTab(
                'Будинок i котедж', 'lib/assets/icons/private-house-order.svg'),
            _individualTab('Кухня', 'lib/assets/icons/kitchen-order.svg'),
            _individualTab(
                'Подорувати прибирання', 'lib/assets/icons/present-order.svg'),
          ],
        ),
      ),
    );
  }

  Widget _individualTab(String title, String urlIcon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(

        children: [
          const SizedBox(
            height: 9.43,
          ),
          SvgPicture.asset(
            urlIcon,
            height: 22,
          ),
          const SizedBox(
            height: 9.43,
          ),
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.labelTab,
            ),
          ),
          // const SizedBox(
          //   height: 9.43,
          // ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const DividerTitle(title: 'Вибiр послуг');
  }

  void _initTabController() {
    _tabController = TabController(vsync: this, length: 10)
      ..addListener(() {
        setState(() {
          _currentTabIndex = _tabController.index;
          if(_navigationService.isOffline()==true){
            _tabController.index=_tabController.previousIndex;
          }
          print('_currentTabIndex $_currentTabIndex');
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
    // if(_navigationService.isOffline()==false)
    // _tabController.animateTo(context.read<HomeProvider>().selectedTabIndex);
  }
}

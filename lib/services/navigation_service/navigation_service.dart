import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../../home_page.dart';
import '../connectivity_service/connectivity_service.dart';


class NavigationService {
  static final NavigationService _singleton = NavigationService._internal();
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;

  factory NavigationService() => _singleton;

  NavigationService._internal();

  bool isOffline() {
    if ((HomePageState.source.keys.toList()[0] == ConnectivityResult.none)) {
      HomePageState.showToast(_networkConnectivity.string);
      return true;
    }
    return false;
  }

  Future<dynamic> push(
    BuildContext context,
    Widget page, {
    bool withoutAnimation = false,
  }) async {
    if (isOffline()) return;
    if (withoutAnimation) {
      return await Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
          ));
    } else {
      return await Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) {
          return page;
        }),
      );
    }
  }

  Future<void> pushReplacement(
    BuildContext context,
    Widget page,
  ) async {
    if (isOffline()) return;
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  Future<void> pushAndRemoveUntil(
    BuildContext context,
    Widget page,
    RoutePredicate predicate,
  ) async {
    if (isOffline()) return;
    await Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      predicate,
    );
  }
}

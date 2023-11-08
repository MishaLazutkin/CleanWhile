import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'providers/cars_provider.dart';
import 'providers/default_order_provider.dart';
import 'providers/info_provider.dart';
import 'providers/home_provider.dart';
import 'providers/kitchen_provider.dart';
import 'providers/present_provider.dart';
import 'providers/private_house_provider.dart';
import 'providers/dry_cleaner_provider.dart';
import 'providers/handy_man_provider.dart';
import 'providers/office_provider.dart';
import 'providers/profile_provider.dart';
import 'providers/repair_provider.dart';
import 'providers/window_cleaner_provider.dart';

void bootstrap() async {
  HttpOverrides.global =   MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DefaultOrderProvider()),
          ChangeNotifierProvider(create: (_) => RepairProvider()),
          ChangeNotifierProvider(create: (_) => WindowProvider()),
          ChangeNotifierProvider(create: (_) => DryCleanerProvider()),
          ChangeNotifierProvider(create: (_) => HandyManProvider()),
          ChangeNotifierProvider(create: (_) => OfficeProvider()),
          ChangeNotifierProvider(create: (_) => CarsProvider()),
          ChangeNotifierProvider(create: (_) => PrivateHouseProvider()),
          ChangeNotifierProvider(create: (_) => KitchenProvider()),
          ChangeNotifierProvider(create: (_) => PresentProvider()),
          ChangeNotifierProvider(create: (_) => ProfileProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => InfoProvider()),
        ],
        child: const MyApp(),
      ));
}
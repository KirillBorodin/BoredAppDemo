import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/presentation/res/colors/colors.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';
import 'app/router.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  FlutterError.onError = (details) {
    print(details.exceptionAsString());
    print(details.stack.toString());
  };
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.blue, // navigation bar color
    statusBarColor: AppColors.blue, // status bar color
  ));
  runZonedGuarded(
      () => runApp(
            MyApp(),
          ), (error, stacktrace) {
    print(error.toString());
    print(stacktrace.toString());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      theme: ThemeData(
        primaryColor: AppColors.blue,
        backgroundColor: AppColors.white,
        fontFamily: 'Museo',
        appBarTheme: AppBarTheme(
          color: AppColors.blue,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      navigatorKey: StackedService.navigatorKey,
    );
  }
}

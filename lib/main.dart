import 'dart:io';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irl/constants/appcolor.dart';
import 'package:irl/firebase_options.dart';
import 'package:irl/presentation/getx/appPages.dart';
import 'package:irl/presentation/splash_screen.dart';
import 'approutes.dart';
import 'datasource/remote/services/dio/dio.dart';
import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  HttpOverrides.global = MyHttpOverrides();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );
  await GetStorage.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.backgroundColor,
  ));
  runApp(const IRL());
}

class IRL extends StatelessWidget {
  const IRL({super.key, });
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            title: 'In Real Life',
            debugShowCheckedModeBanner: false,
            initialBinding: InitialBinding(),
            builder: EasyLoading.init(),
             home: const SplashScreen(),
             initialRoute:  AppRoutes.splashScreen,
             getPages: AppPages.list,
          );
        }
    );
  }
}

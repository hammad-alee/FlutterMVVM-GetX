import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/app_color.dart';
import 'package:mvvm_getx/routes/app_route_name.dart';
import 'package:mvvm_getx/services/initial_bin.dart';

import 'res/localization/app_localization.dart';
import 'routes/app_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, //// For iOS (dark icons)
      ),
    );
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      popGesture: true,
      debugShowMaterialGrid: false,
      //themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      translations: Language(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'Prime Medic',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(AppColor.primary),
          overlayColor: MaterialStateProperty.all(AppColor.primary),
          splashRadius: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:
                BorderSide(style: BorderStyle.solid, color: AppColor.primary),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: Colors.black87),
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: Colors.black87),
          ),
          labelStyle: TextStyle(color: AppColor.text1),
          floatingLabelStyle: TextStyle(color: AppColor.primary),
          iconColor: AppColor.secondary,
          hintStyle: TextStyle(color: AppColor.primary.withAlpha(99)),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:
                BorderSide(style: BorderStyle.solid, color: AppColor.primary),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: Colors.black87),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:
                BorderSide(style: BorderStyle.solid, color: AppColor.primary),
          ),
        ),
        fontFamily: "Roboto",
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(primary: AppColor.primary, secondary: AppColor.secondary),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: AppColor.primary,
        dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      ),
//       darkTheme: ThemeData(
//         accentColor: CColor.secondary,
//           brightness: Brightness.light,
//           primaryColor: CColor.primary,
//         backgroundColor: Colors.amber
// ),
      initialBinding: InitialBin(),
      initialRoute: AppRouteName.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}

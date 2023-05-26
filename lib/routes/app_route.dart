import 'package:get/get.dart';
import 'package:mvvm_getx/routes/app_route_name.dart';
import 'package:mvvm_getx/view/splash_view.dart';

import '../view_model/splash_view_model/splash_bin.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: AppRouteName.initialRoute,
      page: () => const SplashView(),
      bindings: [
        SplashBin(),
      ],
    ),
    // GetPage(
    //   name: login,
    //   page: () => const LoginScr(),
    //   bindings: [
    //     SplashBin(),
    //   ],
    // ),

    // GetPage(
    //   name: initialRoute,
    //   page: () => const TestPage(),
    //   bindings: [
    //     TestBinding(),
    //   ],
    // ),
  ];
}

import 'package:get/get.dart';
import 'package:mvvm_getx/view_model/splash_view_model/splash_view_model.dart';

class SplashBin extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashViewModel>(() => SplashViewModel(), fenix: true);
  }
}

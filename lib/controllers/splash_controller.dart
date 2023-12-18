import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_batch_9/view/auth/login.dart';
import 'package:todo_app_batch_9/view/bottom_bar_screen.dart';
import 'package:todo_app_batch_9/view/home/home_screen,.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    
    Future.delayed(const Duration(seconds: 5), () {
      getRoutes();
    });
    super.onInit();
  }

  Future<void> getRoutes() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey('user')) {
      Get.offAll(
        () => const BottomBarScreen(),
        transition: Transition.fade,
        duration: const Duration(
          milliseconds: 500,
        ),
      );
    } else {
      Get.offAll(
        () => LoginPage(),
        transition: Transition.fade,
        duration: const Duration(
          milliseconds: 500,
        ),
      );
    }
  }
}

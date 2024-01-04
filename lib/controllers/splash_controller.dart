import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_batch_9/view/auth/login.dart';
import 'package:todo_app_batch_9/view/bottom_bar_screen.dart';
import 'package:todo_app_batch_9/view/home/home_screen,.dart';

class SplashController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5), () {
      getRoutes();
    });
    super.onInit();
  }

  Future<void> getRoutes() async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (firebaseAuth.currentUser != null) {
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

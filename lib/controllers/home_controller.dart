import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_batch_9/view/auth/login.dart';

class HomeController extends GetxController {
  Future<void> logoutUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.clear().then((value) {
      Get.offAll(() => LoginPage(),transition: Transition.fade,
        duration: const Duration(
          milliseconds: 500,));
    });
  }
}

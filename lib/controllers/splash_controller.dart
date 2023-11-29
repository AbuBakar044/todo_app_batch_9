import 'package:get/get.dart';
import 'package:todo_app_batch_9/view/auth/login.dart';
import 'package:todo_app_batch_9/view/home/home_screen,.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(() =>  LoginPage());
    });
     super.onInit();
  }
}

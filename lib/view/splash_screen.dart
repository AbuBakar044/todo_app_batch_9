import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_batch_9/constants/constants.dart';
import 'package:todo_app_batch_9/controllers/splash_controller.dart';
import 'package:todo_app_batch_9/utils/colors.dart';
import 'package:todo_app_batch_9/widgets/my_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<SplashController>(SplashController());
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        //color: kSecondaryColor,
        gradient: appGradient(),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Image.asset(
                kAppLogo,
                height: 85.0,
                width: 85.0,
              ),
            ),
          ),
          const Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Center(
                child: MyText(
              text: 'Powered By: Todoi',
              color: kWhiteColor,
              size: 15.0,
              weight: FontWeight.bold,
            )),
          ),
        ],
      ),
    ));
  }
}

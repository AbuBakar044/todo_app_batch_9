import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_batch_9/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<SplashController>(SplashController());
    return const Scaffold();
  }
}

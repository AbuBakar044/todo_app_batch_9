import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_batch_9/controllers/home_controller.dart';
import 'package:todo_app_batch_9/widgets/my_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.put<HomeController>(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const MyText(text: 'Home Screen'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            homeCtrl.logoutUser();
          },
          child: const MyText(text: 'Logout'),
        ),
      ),
    );
  }
}

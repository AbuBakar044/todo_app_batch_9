import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_batch_9/constants/constants.dart';
import 'package:todo_app_batch_9/controllers/home_controller.dart';
import 'package:todo_app_batch_9/utils/colors.dart';
import 'package:todo_app_batch_9/widgets/my_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.put<HomeController>(HomeController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   title:
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: appGradient(),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    text: 'Home Screen',
                    size: 30.0,
                    color: kWhiteColor,
                    weight: FontWeight.bold,
                    family: kFreedokaFont,
                  ),
                  MyText(
                    text: 'Bla Blaaaaa Blaaaa Blaaaaa Blaaaaa Blaaaar',
                    color: kWhiteColor,
                    size: 13,
                    family: kFreedokaFont,
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: GridView.builder(
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10.0,
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                          ),
                          child: SizedBox(
                            //height: 100.0,
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_batch_9/constants/constants.dart';
import 'package:todo_app_batch_9/controllers/auth/auth_controller.dart';
import 'package:todo_app_batch_9/utils/colors.dart';
import 'package:todo_app_batch_9/widgets/my_text.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authCtrl = Get.put<AuthController>(AuthController());
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(gradient: appGradient()),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: authCtrl.registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MyText(
                    text: 'Register',
                    color: kWhiteColor,
                    size: 32,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: authCtrl.fullNameCtrl,
                    validator: customValidator,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: const TextStyle(
                        color: kWhiteColor,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kWhiteColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: authCtrl.emailCtrl,
                    validator: customValidator,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                        color: kWhiteColor,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kWhiteColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: authCtrl.passCtrl,
                    validator: customValidator,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        color: kWhiteColor,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kWhiteColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (authCtrl.registerFormKey.currentState!.validate()) {
                        authCtrl.registerUserWithFirebase(
                            'abc@email.com', '123456');
                      }
                      
                    },
                    child: const Text('Signup'),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Back to Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

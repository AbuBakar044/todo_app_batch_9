import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_batch_9/constants/constants.dart';
import 'package:todo_app_batch_9/controllers/auth/auth_controller.dart';
import 'package:todo_app_batch_9/utils/colors.dart';
import 'package:todo_app_batch_9/view/auth/register.dart';
import 'package:todo_app_batch_9/widgets/my_text.dart';

class LoginPage extends StatelessWidget {
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
              key: authCtrl.loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MyText(
                    text: 'Login',
                    color: kWhiteColor,
                    size: 32,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20),
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
                    obscureText: true,
                    validator: customValidator,
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
                      // Handle login logic here
                      if (authCtrl.loginFormKey.currentState!.validate()) {
                         authCtrl.loginUserWithFirebase(
                            authCtrl.emailCtrl.text, authCtrl.passCtrl.text);
                      }
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              // Handle forgot password logic here
                             
                            },
                            child: const MyText(
                              text: 'Forgot Password?',
                              size: 12.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => RegisterPage());
                            },
                            child: const MyText(
                              text: 'No Account? Signup',
                              size: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ],
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

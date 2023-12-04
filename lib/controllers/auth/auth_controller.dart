import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_batch_9/constants/constants.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final fullNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  final registerFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();


  Future<void> registerUserWithFirebase(String email, String password) async {
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Get.snackbar(
        kAppName,
        'Account bn gya j',
        backgroundColor: Colors.green,
      );
    });
  }

  Future<void> loginUserWithFirebase(String email, String password) async {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Get.snackbar(
        kAppName,
        'LoggedIn Successfully',
        backgroundColor: Colors.green,
      );
    });
  }
}

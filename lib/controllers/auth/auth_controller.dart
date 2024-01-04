import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_batch_9/constants/constants.dart';
import 'package:todo_app_batch_9/view/home/home_screen,.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../view/bottom_bar_screen.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  GoogleSignInAuthentication? googleSignInAuthentication;
  AuthCredential? authCredential;
  UserCredential? userCredential;
  bool isHidden = true;

  final fullNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  final registerFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  // Future<void> registerUserWithFirebase(
  //     String fullName, String email, String password) async {
  //   firebaseAuth
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .then((value) {
  //     //saveUserDataLocallyy(value.user!.uid);
  //     saveUserData(value.user!.uid, fullName, email, password).then((value) {
  //       Get.snackbar(
  //         kAppName,
  //         'Account created successfully',
  //         backgroundColor: Colors.green,
  //       );
  //     });
  //   });
  // }

  Future<void> registerUserWithFirebase(
      String fullName, String email, String password) async {
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      saveUserData(value.user!.uid, fullName, email, password);
    });
  }

  Future<void> loginUserWithFirebase(String email, String password) async {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      //saveUserDataLocallyy(value.user!.uid);
      Get.snackbar(
        kAppName,
        'LoggedIn Successfully',
        backgroundColor: Colors.green,
      );
      Get.offAll(() => BottomBarScreen());
    });
  }

  Future<void> saveUserData(
      String userID, String fullName, String email, String password) async {
    Map<String, dynamic> userData = {
      'fullname': fullName,
      'email': email,
      'pass': password,
    };
    await firebaseFirestore
        .collection(kUserCollection)
        .doc(userID)
        .set(userData)
        .then((value) {
      fullNameCtrl.clear();
      passCtrl.clear();
      emailCtrl.clear();
      //saveUserDataLocallyy(userID);
      Get.offAll(
        () => const BottomBarScreen(),
      );
    });
  }

  // Future<void> saveUserDataLocallyy(String userId) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString('user', userId);
  // }

  Future<void> signInUserWithGoogle() async {
    googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      googleSignInAuthentication = await googleSignInAccount!.authentication;

      authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication!.accessToken,
          idToken: googleSignInAuthentication!.idToken);

      try {
        firebaseAuth.signInWithCredential(authCredential!).then((value) {
          saveUserData(value.user!.uid, value.user!.displayName!,
              value.user!.email!, authCredential!.accessToken!);
        });
      } catch (e) {}
    }
  }

  void changeVisibility() {
    isHidden = !isHidden;
    update();
  }
}

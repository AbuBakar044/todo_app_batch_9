import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_batch_9/constants/constants.dart';
import 'package:todo_app_batch_9/view/bottom_bar_screen.dart';

class CreateToDoController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  String? userId;
  @override
  void onInit() {
    getUserId;
    super.onInit();
  }

  Future<void> getUserId() async {
    print('......................This is User ID');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey('user')) {
      userId = sharedPreferences.getString('user');

      print('......................This is User ID $userId');
    }
  }

  Future<void> saveTodoToDB(String title, String desc) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    firebaseFirestore
        .collection(kUserCollection)
        .doc(firebaseAuth.currentUser!.uid)
        .update({
      'todo': FieldValue.arrayUnion([
        {
          'title': title,
          'dessc': desc,
        }
      ])
    });
  }
}

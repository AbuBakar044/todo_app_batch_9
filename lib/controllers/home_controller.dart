import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_batch_9/constants/constants.dart';
import 'package:todo_app_batch_9/models/user_model.dart';
import 'package:todo_app_batch_9/view/auth/login.dart';

class HomeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DocumentSnapshot? documentSnapshot;
  UserModel? userModel;
  String? title;
  String? desc;

  @override
  onInit() {
    fetchTodos();
    super.onInit();
  }

  Future<void> fetchTodos() async {
    documentSnapshot = await firebaseFirestore
        .collection(kUserCollection)
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    print(
        '..........................................${documentSnapshot!.data().toString()}');

    //title = documentSnapshot!.data();
  }

  Future<void> logoutUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.clear().then((value) {
      Get.offAll(() => LoginPage(),
          transition: Transition.fade,
          duration: const Duration(
            milliseconds: 500,
          ));
    });
  }
}

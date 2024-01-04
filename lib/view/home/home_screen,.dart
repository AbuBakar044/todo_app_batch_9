import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_batch_9/constants/constants.dart';
import 'package:todo_app_batch_9/controllers/home_controller.dart';
import 'package:todo_app_batch_9/models/user_model.dart';
import 'package:todo_app_batch_9/utils/colors.dart';
import 'package:todo_app_batch_9/widgets/my_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.put<HomeController>(HomeController());
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    List<TodoModel> allTodos = [];
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   title:
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      // ),
      body: bgContainer(
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
                  child: StreamBuilder(
                      stream: firebaseFirestore
                          .collection('users')
                          .doc(firebaseAuth.currentUser!.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (!snapshot.hasData) {
                          return const Center(
                            child:
                                MyText(text: 'You don\'t have any todos left'),
                          );
                        } else {
                          var todos = snapshot.data!['todo'] as List;
                          allTodos =
                              todos.map((e) => TodoModel.fromMap(e)).toList();
                          return GridView.builder(
                              itemCount: allTodos.length,
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
                                      10.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                              10.0,
                                            ),
                                            topRight: Radius.circular(
                                              10.0,
                                            ),
                                          ),
                                          color: Colors.amber,
                                        ),
                                        child: Center(
                                          child: MyText(
                                            align: TextAlign.center,
                                            text: allTodos[index].title!,
                                            size: 20.0,
                                            color: kBlackColor,
                                            weight: FontWeight.bold,
                                            family: kFreedokaFont,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyText(
                                          text: allTodos[index].desc!,
                                          size: 14.0,
                                          color: kBlackColor,
                                          weight: FontWeight.normal,
                                          family: kFreedokaFont,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_batch_9/constants/constants.dart';
import 'package:todo_app_batch_9/controllers/createtodo/create_todo_controller.dart';

import '../../utils/colors.dart';
import '../../widgets/my_text.dart';
import '../bottom_bar_screen.dart';

class CreateTodoScreen extends StatefulWidget {
  CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final creatTodoCtrl = Get.put<CreateToDoController>(CreateToDoController());

  @override
  void initState() {
    creatTodoCtrl.getUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('.........................Running');
    return Scaffold(
      body: bgContainer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyText(
                      text: 'Create Todo',
                      size: 30.0,
                      color: kWhiteColor,
                      weight: FontWeight.bold,
                      family: kFreedokaFont,
                    ),
                    MyText(
                      text: 'Create a new todo',
                      color: kWhiteColor,
                      size: 13,
                      family: kFreedokaFont,
                    )
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: creatTodoCtrl.titleController,
                      style: const TextStyle(
                        color: kWhiteColor,
                      ),
                      decoration: const InputDecoration(
                          labelText: 'Title',
                          labelStyle: TextStyle(
                            color: kWhiteColor,
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      maxLines: 1,
                      controller: creatTodoCtrl.descriptionController,
                      style: const TextStyle(
                        color: kWhiteColor,
                      ),
                      decoration: const InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(
                            color: kWhiteColor,
                          )),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add your logic to create the todo here
                        String title = creatTodoCtrl.titleController.text;
                        String description =
                            creatTodoCtrl.descriptionController.text;

                        // Validate input (you can add more validation)
                        if (title.isNotEmpty && description.isNotEmpty) {
                          // Create the todo and navigate back
                          // You can use Get.to() or Navigator.push() here

                          creatTodoCtrl
                              .saveTodoToDB(title, description)
                              .then((value) {
                            creatTodoCtrl.titleController.clear();
                            creatTodoCtrl.descriptionController.clear();
                            //Get.back();
                          });
                        } else {
                          Get.snackbar(
                            'Validation Error',
                            'Please fill in both title and description fields.',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                      child: const Text('Create Todo'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

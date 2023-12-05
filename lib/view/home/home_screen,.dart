import 'package:flutter/material.dart';
import 'package:todo_app_batch_9/widgets/my_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: MyText(text: 'Home Screen'),
      ),
    );
  }
}
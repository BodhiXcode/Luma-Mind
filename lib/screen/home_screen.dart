import 'package:flutter/material.dart';
import 'package:luma_mind/widgets/getting_to_know_widget.dart';
import 'package:luma_mind/widgets/new_user_widget.dart';
import 'package:luma_mind/widgets/stack_wiget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Luma Mind")),
      body: Column(
        children: [
          const SizedBox(height: 10),
          StackWiget(widgets: [NewUserWidget(), GettingToKnowWidget()]),
        ],
      ),
    );
  }
}

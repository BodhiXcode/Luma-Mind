import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:luma_mind/widgets/getting_to_know_widget.dart';
import 'package:luma_mind/widgets/new_user_widget.dart';
import 'package:luma_mind/widgets/stack_wiget.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          StackWiget(widgets: [NewUserWidget(), GettingToKnowWidget()]),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MasonryGridView.count(
                itemCount: 100,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 200 + (index % 4) * 20,
                    child: ShadCard(
                      title: Text("Dummy Title"),
                      description: Text("dummy subtitle"),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text("summary or partial content"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
      floatingActionButton: ShadIconButton(
        icon: Icon(LucideIcons.pencil),
        onPressed: () {
          context.push("/new_thought");
        },
      ),
    );
  }
}

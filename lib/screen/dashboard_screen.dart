import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:luma_mind/widgets/getting_to_know_widget.dart';
import 'package:luma_mind/widgets/new_user_widget.dart';
import 'package:luma_mind/widgets/stack_wiget.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        StackWiget(widgets: [NewUserWidget(), GettingToKnowWidget()]),
        const SizedBox(height: 10),
        Expanded(
          child: MasonryGridView.count(
            itemCount: 100,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            crossAxisCount: 2,
            itemBuilder: (context, index) {
              return ConstrainedBox(
                constraints: BoxConstraints(minHeight: 100 + (index % 4) * 20),
                child: ShadCard(
                  title: Text("Dummy Title"),
                  description: Text("dummy subtitle"),
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 10,
                    children: [
                      ShadIconButton(icon: Icon(LucideIcons.pen)),
                      ShadIconButton(icon: Icon(LucideIcons.view)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text("summary or partial content"),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

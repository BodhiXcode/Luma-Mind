import 'package:flutter/material.dart';
import 'package:luma_mind/enums/widget_enums.dart';

class GettingToKnowWidget extends StatelessWidget {
  const GettingToKnowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: WidgetDimesion.normalHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/cloud_mountain.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "I am getting to know you!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "Once I know you, I can forecast your mood, show you graph of mood swings and more!",
            ),
          ],
        ),
      ),
    );
  }
}

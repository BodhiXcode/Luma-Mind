import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:luma_mind/enums/widget_enums.dart';

class NewUserWidget extends StatefulWidget {
  const NewUserWidget({super.key});

  @override
  State<NewUserWidget> createState() => _NewUserWidgetState();
}

class _NewUserWidgetState extends State<NewUserWidget> {
  final int animationSpeed = 100;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: WidgetDimesion.normalHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/sun_rise_snow_mountain.jpg"),
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
          children: [
            Text(
              "✨ Welcome to Luma Mind!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Start by writing your first thought",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "I've got you covered for your:",
              style: TextStyle(color: Colors.white),
            ),
            DefaultTextStyle(
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
              child: AnimatedTextKit(
                pause: Duration(milliseconds: 2500),
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Emotions",
                    cursor: "",
                    speed: Duration(milliseconds: animationSpeed),
                  ),
                  TypewriterAnimatedText(
                    "Todos",
                    cursor: "",
                    speed: Duration(milliseconds: animationSpeed),
                  ),
                  TypewriterAnimatedText(
                    "Thoughts",
                    cursor: "",
                    speed: Duration(milliseconds: animationSpeed),
                  ),
                  TypewriterAnimatedText(
                    "Rant",
                    cursor: "",
                    speed: Duration(milliseconds: animationSpeed),
                  ),
                  TypewriterAnimatedText(
                    "Journal",
                    cursor: "",
                    speed: Duration(milliseconds: animationSpeed),
                  ),
                  TypewriterAnimatedText(
                    "Gratitude",
                    cursor: "",
                    speed: Duration(milliseconds: animationSpeed),
                  ),
                  TypewriterAnimatedText(
                    "Progress",
                    cursor: "",
                    speed: Duration(milliseconds: animationSpeed),
                  ),
                  TypewriterAnimatedText(
                    "Mood",
                    cursor: "",
                    speed: Duration(milliseconds: animationSpeed),
                  ),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luma_mind/screen/register_screen.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'Welcome to\nLumaMind 🌙',
      'text':
          'A gentle friend to help you untangle your thoughts and lighten your mind.',
    },
    {
      'title': 'Capture Your Loops 🧠',
      'text':
          'Not just tasks — jot down thoughts, patterns, and emotional cycles you want to break.',
    },
    {
      'title': 'Reflect with Kindness 🪞',
      'text':
          'Daily check-ins and warm prompts help you understand yourself better, without judgment.',
    },
    {
      'title': 'Build Emotional Momentum 🌱',
      'text':
          'Track your growth, see your healing, and celebrate even the tiniest wins.',
    },
    {
      'title': 'We’re in This Together 🤝',
      'text':
          'Whenever you feel stuck, LumaMind is here — curious, calm, and always listening.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _pages[index]['title']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      index == _pages.length - 1
                          ? Column(
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  _pages[index]['text']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 50),
                                ShadIconButton(
                                  icon: const Icon(LucideIcons.arrowRight),
                                  onPressed: () {
                                    Get.off(() => RegisterScreen());
                                  },
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.white : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

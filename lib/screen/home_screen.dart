import 'package:flutter/material.dart';
import 'package:luma_mind/modals/page.dart';
import 'package:luma_mind/screen/dashboard_screen.dart';
import 'package:luma_mind/screen/feed_screen.dart';
import 'package:luma_mind/screen/journal_screen.dart';
import 'package:luma_mind/screen/luma_chat_screen.dart';
import 'package:luma_mind/screen/progress_screen.dart';
import 'package:luma_mind/screen/settings_screen.dart';
import 'package:luma_mind/widgets/bottom_navbar.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  late final PageController _pageController;
  List<NavPage> pages = [
    NavPage(DashboardScreen(), "Dashboard"),
    NavPage(JournalScreen(), "Journals"),
    NavPage(LumaChatScreen(), "Chats"),
    NavPage(ProgressScreen(), "Progress"),
    NavPage(FeedScreen(), "Feeds"),
    NavPage(SettingsScreen(), "Settings"),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[currentPageIndex].title)),
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        onPageChanged: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return pages[index].page;
        },
      ),
      bottomNavigationBar: BottomNavbar(
        onPageChanged: (value) {
          setState(() {
            currentPageIndex = value;
          });
          _pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        currentIndex: currentPageIndex,
        mainNavIcons: [
          LucideIcons.layoutDashboard,
          LucideIcons.bookOpenText,
          LucideIcons.messagesSquare,
          LucideIcons.trendingUp,
          LucideIcons.globe,
          LucideIcons.user,
        ],
      ),
    );
  }
}

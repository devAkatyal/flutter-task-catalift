import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';
import 'home_screen.dart';
import 'explore_mentors_screen.dart';
import 'courses_screen.dart';
import '../utils/app_colors.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final MainController mainController = Get.put(MainController());

  final List<Widget> screens = [
    const HomeScreen(),
    ExploreMentorsScreen(),
    const CoursesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        title: Image.asset('assets/images/ic_catalift.png'),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/ic_profile.png',
              height: 24,
              width: 24,
              color: Color(0xFFE5E5EE),
            ),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/ic_notification.png',
              height: 24,
              width: 24,
              color: Color(0xFFE5E5EE),
            ),
            onPressed: () {
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.chat_bubble_outline,
              color: Color(0xFFE5E5EE),
            ),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Obx(
        () => IndexedStack(
          index: mainController.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: mainController.selectedIndex.value,
          onTap: mainController.changeTabIndex,
          backgroundColor: AppColors.primaryBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/ic_home_outlined.png',
                height: 24,
                width: 24,
                color: Color(0xFFE5E5EE),
              ),
              activeIcon: Image.asset(
                'assets/images/ic_home.png',
                height: 24,
                width: 24,
                color: Color(0xFFE5E5EE),
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: 'Explore Mentors',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined),
              activeIcon: Icon(Icons.menu_book),
              label: 'Courses',
            ),
          ],
        ),
      ),
    );
  }
}

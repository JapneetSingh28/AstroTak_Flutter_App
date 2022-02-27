import 'profile_settings_screens/profile_settings_screen.dart';

import 'package:flutter/material.dart';

import '../../utilities/constants.dart';
import 'ask_question_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  static const String id = 'bottom_navigation_screen';

  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  iconImage({required String assetName, required int index}) {
    return Image.asset(
      'assets/icons/$assetName.png',
      height: 20.0,
      width: 20.0,
      color: (selectedIndex == index) ? primaryColor : unselectedColor,
    );
  }

  List<Widget> _buildScreens() {
    return [
      const Center(child: Text('Home')),
      const Center(child: Text('Talk')),
      const AskQuestionScreen(),
      const Center(child: Text('Reports')),
      const Center(child: Text('Chat')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/icons/hamburger.png',
          height: 25,
          width: 25,
        ),
        title: Image.asset(
          'assets/icons/icon.png',
          width: 55,
          height: 55,
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              ProfileSettingsScreen.id,
            ),
            child: Image.asset(
              'assets/icons/profile.png',
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(width: 10),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: _buildScreens()[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        elevation: 0.0,
        selectedItemColor: primaryColor,
        unselectedItemColor: unselectedColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: iconImage(assetName: 'home', index: 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: iconImage(assetName: 'talk', index: 1),
            label: 'Talk',
          ),
          BottomNavigationBarItem(
            icon: iconImage(assetName: 'ask', index: 2),
            label: 'Ask Question',
          ),
          BottomNavigationBarItem(
            icon: iconImage(assetName: 'reports', index: 3),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: iconImage(assetName: 'chat', index: 4),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/text_styles.dart';
import 'my_profile.dart';

class ProfileSettingsScreen extends StatefulWidget {
  static const String id = 'profile_settings_screen';

  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
              size: 20,
            ),
          ),
          title: Image.asset(
            'assets/icons/icon.png',
            width: 55,
            height: 50,
          ),
          actions: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  child: OutlinedButton(
                    child: Text("Logout", style: logoutStyle),
                    onPressed: () {
                      // print("Logout pressed");
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(width: 1.0, color: primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15)
              ],
            )
          ],
          bottom: TabBar(
            indicatorColor: primaryColor,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 1.5,
                color: primaryColor,
              ),
              insets: const EdgeInsets.symmetric(horizontal: 10.0),
            ),
            labelColor: primaryColor,
            unselectedLabelColor: unselectedTabFontColor,
            labelStyle: tabSelectedStyle,
            unselectedLabelStyle: tabUnSelectedStyle,
            tabs: const [
              Tab(text: 'My Profile'),
              Tab(text: 'Order History'),
            ],
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        body: const TabBarView(
          children: [
            MyProfile(),
            Center(
              child: Text('Order History'),
            )
          ],
        ),
      ),
    );
  }
}

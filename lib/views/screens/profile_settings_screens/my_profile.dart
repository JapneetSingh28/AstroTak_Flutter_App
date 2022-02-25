import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/text_styles.dart';
import 'friends_and_family_profile_screens/friends_and_family_profile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      padding: const EdgeInsets.all(15),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                bottom: TabBar(
                  labelPadding: EdgeInsets.zero,
                  indicatorWeight: 0.0,
                  labelColor: Colors.white,
                  unselectedLabelColor: unselectedTabFontColor,
                  indicator: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelStyle: tabSelectedStyle2,
                  unselectedLabelStyle: tabUnSelectedStyle2,
                  tabs: const [
                    Tab(
                      text: 'Basic Profile',
                    ),
                    Tab(text: 'Friends and Family Profile'),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Text('Basic Profile'),
                  ),
                  FriendsNFamilyProfile()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

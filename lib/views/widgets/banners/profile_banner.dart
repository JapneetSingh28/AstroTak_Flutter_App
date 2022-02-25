import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/text_styles.dart';

class ProfileBanner extends StatelessWidget {
  const ProfileBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bannerLightColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 45,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              Icons.account_balance_wallet_rounded,
              color: bannerColor,
            ),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              'Wallet Balance : ₹ 0',
              style: TextStyle(
                fontSize: 14.0,
                color: bannerColor,
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            SizedBox(
              height: 25,
              child: OutlinedButton(
                child: Text(
                  'Add money',
                  style: addMoneyStyle,
                ),
                onPressed: () {
                  // print("Pressed: Add money");
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(width: 1.0, color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

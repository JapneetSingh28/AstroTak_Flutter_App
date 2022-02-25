import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/text_styles.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bannerColor,
      height: 58,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Wallet balace: ₹ 0',
              style: bannerStyle1,
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
            )
          ],
        ),
      ),
    );
  }
}

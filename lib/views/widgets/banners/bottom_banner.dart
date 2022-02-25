import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/text_styles.dart';

class BottomBanner extends StatelessWidget {
  final String tagName;
  final int price;
  final Function onPressed;
  const BottomBanner(
      {Key? key,
      required this.tagName,
      required this.price,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bannerColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('₹ $price (1 Question on $tagName )', style: bannerStyle2),
            SizedBox(
              height: 30,
              child: OutlinedButton(
                child: Text(
                  'Ask Now',
                  style: askNowStyle,
                ),
                onPressed: () => onPressed(),
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

import 'package:flutter/material.dart';

import '../../utilities/constants.dart';
import '../../utilities/text_styles.dart';

class QnABoxView extends StatelessWidget {
  const QnABoxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
         const SizedBox(height: 10),
          const Text(
              'Seeking accurate answers to difficult questions troubling your mind? Ask credible astrologers to know what future has in store for you.'),
          Container(
            decoration: BoxDecoration(
              color: lightPrimaryColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    '• Personalized responses provided by our team of Vedic astrologers within 24 hours.',
                    style: notesStyle),
                Text(
                    '• Qualified and experienced astrologers will look into your birth chart and provide the right guidance.',
                    style: notesStyle),
                Text(
                    '• You can seek answers to any part of your life and for most pressing issues.',
                    style: notesStyle),
                Text(
                    '• Our team of Vedic astrologers will not just provide answers but also suggest a remedial solution.',
                    style: notesStyle),
              ],
            ),
          )
        ],
      ),
    );
  }
}

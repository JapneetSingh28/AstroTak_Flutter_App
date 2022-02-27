import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

class QuestionTile extends StatelessWidget {
  final String question;

  const QuestionTile({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/icons/question.png', height: 35, width: 30),
                const SizedBox(width: 5.0),
                Flexible(
                  child: Text(
                    question,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: unselectedColor,
            )
          ],
        ),
      ),
    );
  }
}

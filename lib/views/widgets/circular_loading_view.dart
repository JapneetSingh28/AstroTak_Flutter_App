import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: primaryColor,
        strokeWidth: 1.0,
      ),
    );
  }
}

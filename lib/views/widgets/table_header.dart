import 'package:flutter/material.dart';

import '../../utilities/size_config.dart';
import '../../utilities/text_styles.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 5),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Name',
                  style: tableHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'DOB',
                  style: tableHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'TOB',
                  style: tableHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'Relation',
                  style: tableHeading,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.27,
        ),
      ],
    );
  }
}

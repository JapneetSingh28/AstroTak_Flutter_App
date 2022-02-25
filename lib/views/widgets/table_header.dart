import 'package:flutter/material.dart';

import '../../utilities/size_config.dart';
import '../../utilities/text_styles.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Name',
                style: tableHeadling,
              ),
              Text(
                '  DOB  ',
                style: tableHeadling,
              ),
              Text(
                'TOB',
                style: tableHeadling,
              ),
              Text(
                'Relation',
                style: tableHeadling,
              ),
            ],
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.28,
        ),
      ],
    );
  }
}

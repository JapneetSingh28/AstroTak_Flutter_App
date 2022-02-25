import '../../../../data/models/relative_model.dart';
import 'package:flutter/material.dart';

import '../../../../utilities/constants.dart';
import '../../../../utilities/text_styles.dart';
import '../../../widgets/button.dart';
import '../../../widgets/banners/profile_banner.dart';
import '../../../widgets/tiles/relative_tile.dart';
import '../../../widgets/table_header.dart';

class FriendsAndFamilyDetailedBody extends StatefulWidget {
  final RelativeModel? relativeModel;
  final Function onTapAddButton;
  final Function onTapEditButton;

  const FriendsAndFamilyDetailedBody(
      {Key? key,
      required this.relativeModel,
      required this.onTapAddButton,
      required this.onTapEditButton})
      : super(key: key);

  @override
  State<FriendsAndFamilyDetailedBody> createState() =>
      _FriendsAndFamilyDetailedBodyState();
}

class _FriendsAndFamilyDetailedBodyState
    extends State<FriendsAndFamilyDetailedBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const ProfileBanner(),
          const SizedBox(
            height: 15,
          ),
          const TableHeader(),
          const SizedBox(
            height: 8,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.relativeModel?.allRelatives.length ?? 0,
              itemBuilder: (context, index) {
                final relativeData = widget.relativeModel?.allRelatives[index];
                return RelativeTile(
                  relativeDetails: relativeData,
                  onTapEditButton: widget.onTapEditButton,
                );
              }),
          const SizedBox(
            height: 10,
          ),
          Button(
            height: 35,
            width: 150,
            text: '+ Add New Profile',
            onPress: () => widget.onTapAddButton(),
          )
        ],
      ),
    );
  }
}

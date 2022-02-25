import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/relative_model.dart';
import '../../../../logic/bloc/relative_bloc/relative_bloc.dart';
import '../../../../utilities/constants.dart';
import 'add_new_relative.dart';
import 'friends_and_family_detailed_body.dart';

class FriendsNFamilyProfile extends StatefulWidget {
  const FriendsNFamilyProfile({Key? key}) : super(key: key);

  @override
  State<FriendsNFamilyProfile> createState() => _FriendsNFamilyProfileState();
}

class _FriendsNFamilyProfileState extends State<FriendsNFamilyProfile> {
  bool showNewProfile = false;
  bool updateProfile = false;
  SingleRelativeData? editRelativeData;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelativeBloc, RelativeState>(builder: (context, state) {
      if (state is RelativeLoadedState) {
        if (!showNewProfile) {
          return FriendsAndFamilyDetailedBody(
              relativeModel: state.allRelativesData,
              onTapEditButton: (SingleRelativeData selectedRelativeData) {
                showNewProfile = true;
                editRelativeData = selectedRelativeData;
                setState(() {});
              },
              onTapAddButton: () {
                showNewProfile = true;
                editRelativeData = null;
                setState(() {});
              });
        } else {
          return AddNewRelative(
            relativeData: editRelativeData,
            onBackPressed: () {
              showNewProfile = false;
              setState(() {});
            },
          );
        }
      } else if (state is RelativeLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            color: primaryColor,
            strokeWidth: 1.0,
          ),
        );
      } else if (state is RelativeErrorState) {
        String error = state.errorMessage;
        return Center(child: Text(error));
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: primaryColor2,
            strokeWidth: 1.0,
          ),
        );
      }
    });
  }
}

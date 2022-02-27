import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/relative_model.dart';
import '../../../../logic/bloc/relative_bloc/relative_bloc.dart';
import '../../../widgets/circular_loading_view.dart';
import '../../../widgets/no_internet_view.dart';
import '../../../widgets/snack_bar.dart';
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
  bool previousNoInternet = false;
  SingleRelativeData? editRelativeData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RelativeBloc, RelativeState>(
        listener: (BuildContext context, Object? state) {
      if (state is RelativeNoInternetState) {
        previousNoInternet = true;
        ShowSnackBar().showSnackBar(context, 'Please connect to Internet.',
            backgroundColor: Colors.red);
      } else {
        if (previousNoInternet) {
          previousNoInternet = false;
          ShowSnackBar().showSnackBar(context, 'Back Online.',
              backgroundColor: Colors.green);
        }
      }
    }, builder: (context, state) {
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
        return const CircularLoading();
      } else if (state is RelativeNoInternetState) {
        return const NoInternetView();
      } else if (state is RelativeErrorState) {
        String error = state.errorMessage;
        return Center(child: Text(error));
      } else {
        return const CircularLoading();
      }
    });
  }
}

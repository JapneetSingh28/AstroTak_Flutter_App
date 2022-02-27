import 'package:astro_tak_flutter_app/views/widgets/button.dart';
import 'package:astro_tak_flutter_app/views/widgets/snack_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.signal_wifi_statusbar_connected_no_internet_4_outlined,
              color: primaryColor, size: 90),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'No Internet Connection!',
          ),
          const SizedBox(
            height: 20,
          ),
          Button(
              text: 'Try again',
              onPress: () async {
                final _connectivity = await Connectivity().checkConnectivity();
                if (_connectivity == ConnectivityResult.none) {
                  ShowSnackBar().showSnackBar(
                      context, 'Please connect to Internet.',
                      backgroundColor: Colors.red);
                }
              },
              height: 45,
              width: 150),
        ],
      ),
    );
  }
}

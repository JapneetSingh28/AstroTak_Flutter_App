import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final _connectivity = Connectivity();
  final connectivityStream = StreamController<ConnectivityResult>.broadcast();

  ConnectivityService() {
    _connectivity.checkConnectivity().then((value) {
      if (value == ConnectivityResult.none) {
        // print('_connectivity init $value');
        connectivityStream.add(value);
      }
    });
    _connectivity.onConnectivityChanged.listen((event) {
      // print('_connectivity is $event');
      connectivityStream.add(event);
    });
  }
}

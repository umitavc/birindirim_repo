import 'dart:async';

import 'package:connectivity/connectivity.dart';

typedef NetworkCallBack = void Function(NetworkResult result);

enum NetworkResult { off, on }

class NetworkControl {
  static NetworkResult checkConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        return NetworkResult.on;
      case ConnectivityResult.none:
        return NetworkResult.off;
      default:
    }
  }
}

abstract class INetworkManager {
  void handlerNetworkChange(NetworkCallBack onChange); //callback bu sekilde
  void dispose();
}

class NetworkManagerControl extends INetworkManager {
  Connectivity _connectivity;
  StreamSubscription<ConnectivityResult> _subscription;
  NetworkManagerControl(){
    _connectivity=Connectivity();
  }

  @override
  void handlerNetworkChange(NetworkCallBack onChange) {

    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      onChange.call(NetworkControl.checkConnectivityResult(event));
    });
  }

  @override
  void dispose() {
    if (_subscription != null) {
      _subscription.cancel();
    }
  }
}

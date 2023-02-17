import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stacked/stacked.dart';

class ConnectivityService with ListenableServiceMixin {
  ReactiveValue<bool> _isInternetConnected = ReactiveValue<bool>(true);
  bool get isInternetConnected => _isInternetConnected.value;

  ConnectivityService() {
    listenToReactiveValues([_isInternetConnected]);
    Connectivity().onConnectivityChanged.listen((result) {
      _isInternetConnected.value = result != ConnectivityResult.none;
      notifyListeners();
    });
  }
}

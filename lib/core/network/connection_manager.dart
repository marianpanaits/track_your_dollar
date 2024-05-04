import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionManager {
  final Connectivity _connectivity = Connectivity();

  Future<bool> isConnected() async {
    try {
      List<ConnectivityResult> connectionStatus =
          await _connectivity.checkConnectivity();
      return !connectionStatus.contains(ConnectivityResult.none);
    } catch (e) {
      return false;
    }
  }
}

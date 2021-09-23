import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

///class will return true if the user is connected either to WIFI or MOBILE data
///it use the package of `data connection checker` & `Connectivity`
abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;
  final Connectivity connectivity;
  NetworkInfoImpl({
    required this.dataConnectionChecker,
    required this.connectivity,
  });

  @override
  Future<bool> isConnected() async {
    var hasConnection = await dataConnectionChecker.hasConnection;
    var connectivityResult = await (connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return hasConnection;
    } else {
      return false;
    }
  }
}

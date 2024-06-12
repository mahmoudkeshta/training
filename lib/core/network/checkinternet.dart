import 'dart:io';

Future<bool> checkinternet() async {
  try {
    // Attempt to lookup 'google.com' to check for internet connectivity
    var result = await InternetAddress.lookup("google.com");
    
    // If the result is not empty and contains at least one address, return true
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    // If a SocketException is thrown, return false indicating no internet connection
    return false;
  }
  return false; // Return false if none of the conditions above are met
}

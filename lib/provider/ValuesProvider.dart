//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ValuesProvider with ChangeNotifier {
  String? email = "";
  String? get getEmail {
    return email;
  }

  saveEmail(String? Email) async {
    email = Email;
  }

  bool OnTheEntenet = false;
  bool get getOnTheEntenet {
    return OnTheEntenet;
  }

  // Iam_I_OnTheEntenet() async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.wifi) {
  //     OnTheEntenet = true;
  //   } else {
  //     OnTheEntenet = false;
  //   }
  // }
}

//  connectivity_plus: ^5.0.2
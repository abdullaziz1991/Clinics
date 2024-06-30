import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Not_Logged_In extends StatelessWidget {
  static const screenRoute = '/Not_Logged_In';
  const Not_Logged_In({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 219, 10, 10)),
          child: Text("You are not logged in".tr(),
              style: TextStyle(fontSize: 17, color: Colors.white),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

import 'package:clinics/Screens/Home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

myappBar(String title, double width, bool isLanguageArabic, bool isDark,
        BuildContext context) =>
    AppBar(
      // myappBar(height) => AppBar(
      actions: [
        // GestureDetector(
        //   child: Container(
        //     padding:  EdgeInsets.all(10),
        //     child: Icon(Icons.home),
        //   ),
        //   onTap: () =>
        //       Navigator.of(context).pushReplacementNamed(Home.screenRoute),
        // )

        SizedBox(
          width: width,
        )
      ],
      backgroundColor: Colors.black,
      // preferredSize:
      //     Size(MediaQuery.of(context).size.width, height), //height + 80
      title: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: isLanguageArabic ? 23 : 19,
              fontWeight: FontWeight.w600,
              fontFamily: 'VariableFont_wght',
              color: Colors.white //isDark ? Colors.white : Colors.black,
              // color: Colors.white
              ),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white),
    );

import 'package:clinics/Screens/Home.dart';
import 'package:clinics/Screens/tools/myAppBar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';

class Psychological extends StatefulWidget {
  static final screenRoute = "/Psychological";
  const Psychological({super.key});

  @override
  State<Psychological> createState() => _PsychologicalState();
}

class _PsychologicalState extends State<Psychological> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isLanguageArabic = context.locale.languageCode == "ar";
    Future<bool> _onWillPop() async {
      Navigator.of(context).pushReplacementNamed(Home.screenRoute);
      return (true);
    }

    var screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: myappBar("Psychological counseling".tr(), 45, isLanguageArabic,
            isDark, context),
        body: ListView(children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: screenWidth / 2,
                child: Image.asset(
                  "assets/images/29.jpg",
                  fit: BoxFit.cover,
                  height: screenWidth / 4,
                ),
              ),
              Container(
                height: screenWidth / 2,
                color: Colors.black38,
              ),
              Column(
                children: [
                  OutlinedText(
                    text: Text(
                      "Psychological consultations".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              context.locale.languageCode == "ar" ? 22 : 18,
                          color: Colors.white),
                    ),
                    strokes: [
                      OutlinedTextStroke(color: Colors.black, width: 5),
                      //OutlinedTextStroke(color: Colors.red, width: 8),
                      //  OutlinedTextStroke(color: Colors.blue, width: 8),
                    ],
                  ),
                  SizedBox(height: 5),
                  OutlinedText(
                    text: Text(
                      "Talk to a doctor".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              context.locale.languageCode == "ar" ? 15 : 13),
                    ),
                    strokes: [
                      OutlinedTextStroke(color: Colors.black, width: 3),
                    ],
                  )
                ],
              ),
            ],
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                "You deserve to be happy".tr(),
                style: TextStyle(
                  fontSize: context.locale.languageCode == "ar" ? 20 : 18,
                  color: isDark
                      ? Color.fromARGB(255, 157, 163, 255)
                      : Color.fromARGB(255, 12, 21, 97),
                  fontWeight: FontWeight.bold,
                ),
              )),
          Row(
            children: [
              ItemsMethod(screenWidth, "assets/images/33.webp",
                  "Start treatment".tr(), isDark),
              ItemsMethod(screenWidth, "assets/images/34.jpg",
                  "We are at your service 24 hours".tr(), isDark),
              ItemsMethod(screenWidth, "assets/images/35.jpg",
                  "Pay safely".tr(), isDark),
              ItemsMethod(screenWidth, "assets/images/36.webp",
                  "Enter your information".tr(), isDark),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "What distinguishes us??".tr(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: context.locale.languageCode == "ar" ? 20 : 20,
                color: isDark
                    ? Color.fromARGB(255, 157, 163, 255)
                    : Color.fromARGB(255, 12, 21, 97),
              ),
              textAlign: TextAlign.start,
            ),
          ),
          informationMethod(screenWidth, "Psychologist".tr(),
              "Psychologist 1".tr(), "assets/images/40.jpg", isDark),
          informationMethod(screenWidth, "Psychologist 2".tr(),
              "Psychologist 3".tr(), "assets/images/38.png", isDark),
          informationMethod(screenWidth, "Psychologist 4".tr(),
              "Psychologist 5".tr(), "assets/images/37.png", isDark),
          informationMethod(screenWidth, "Psychologist 6".tr(),
              "Psychologist 7".tr(), "assets/images/39.jpg", isDark),
          Divider(
            height: 10,
            thickness: 5,
            //indent: 20,
            // endIndent: 0,
            color: Colors.black,
          ),
          SizedBox(
            height: 2,
          )
        ]),
      ),
    );
  }

  Container ItemsMethod(
      double screenWidth, String image, String title, bool isDark) {
    return Container(
        width: screenWidth / 4,
        height: screenWidth / 2.2,
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 3, left: 3),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
                height: screenWidth / 4,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: context.locale.languageCode == "ar" ? 14 : 12,
                  color: isDark ? Colors.white : Colors.black),
            ),
          ],
        ));
  }

  Container informationMethod(double screenWidth, String title, String Body,
      String image, bool isDark) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: isDark ? Colors.white : Colors.black),
                  ),
                  Text(
                    Body,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: context.locale.languageCode == "ar" ? 14 : 12,
                        color: isDark ? Colors.white : Colors.black),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.fill,
                    height: screenWidth / 4,
                  ),
                  Container(
                    height: screenWidth / 4,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

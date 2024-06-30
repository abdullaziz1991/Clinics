import 'package:clinics/Screens/Home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Herbal_Treatment extends StatefulWidget {
  static final screenRoute = "/Herbal_Treatment";
  const Herbal_Treatment({super.key});

  @override
  State<Herbal_Treatment> createState() => _Herbal_TreatmentState();
}

class _Herbal_TreatmentState extends State<Herbal_Treatment> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Future<bool> _onWillPop() async {
      Navigator.of(context).pushReplacementNamed(Home.screenRoute);
      return (true);
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text("All about herbs".tr())),
          actions: [
            SizedBox(
              width: 24,
            )
          ],
        ),
        body: ListView(children: [
          // Container(
          //     alignment: Alignment.center,
          //     padding: EdgeInsets.all(10),
          //     child: Text(
          //       "كل شيء عن الاعشاب",
          //       style: TextStyle(fontSize: 25, color: Colors.black),
          //     )),
          Image.asset(
            "assets/images/41.jpg",
            fit: BoxFit.fill,
            //height: screenWidth / 4,
          ),
          normalTextMethod("Introduction to medicinal herbs".tr(), isDark),
          normalTextMethod("Introduction to medicinal herbs2".tr(), isDark),
          Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 10, right: 10, left: 10),
              alignment: Alignment.topRight,
              child: Text(
                "about herbal medicine".tr(),
                style: TextStyle(
                    fontSize: 20, color: isDark ? Colors.white : Colors.black),
              )),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.white,
              color: isDark ? Colors.black : Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black, spreadRadius: 3),
              ],
            ),
            child: Column(
              children: [
                titleMethod("History of herbal medicine".tr(), screenWidth),
                normalTextMethod("histrory 1".tr(), isDark),
                normalTextMethod("histrory 2".tr(), isDark),
                normalTextMethod("histrory 3".tr(), isDark),
                SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isDark ? Colors.black : Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black, spreadRadius: 3),
              ],
            ),
            child: Column(
              children: [
                titleMethod("Medicinal plants".tr(), screenWidth),
                normalTextMethod("plants 1".tr(), isDark),
                SizedBox(height: 10),
                Image.asset(
                  "assets/images/42.jpg",
                  fit: BoxFit.fill,
                  //height: screenWidth / 4,
                ),
                pandMethod("plants 2".tr(), isDark),
                normalTextMethod("plants 3".tr(), isDark),
                normalTextMethod("plants 4".tr(), isDark),
                pandMethod("plants 5".tr(), isDark),
                normalTextMethod("plants 6".tr(), isDark),
                pandMethod("plants 30".tr(), isDark),
                normalTextMethod("plants 7".tr(), isDark),
                pandMethod("plants 8".tr(), isDark),
                normalTextMethod("plants 9".tr(), isDark),
                normalTextMethod("plants 10".tr(), isDark),
                pandMethod("plants 11".tr(), isDark),
                normalTextMethod("plants 12".tr(), isDark),
                normalTextMethod("plants 13".tr(), isDark),
                pandMethod("plants 14".tr(), isDark),
                normalTextMethod("plants 15".tr(), isDark),
                pandMethod("plants 16".tr(), isDark),
                normalTextMethod("plants 17".tr(), isDark),
                normalTextMethod("plants 18".tr(), isDark),
                normalTextMethod("plants 19".tr(), isDark),
                normalTextMethod("plants 20".tr(), isDark),
                normalTextMethod("plants 21".tr(), isDark),
                normalTextMethod("plants 22".tr(), isDark),
                normalTextMethod("plants 23".tr(), isDark),
                pandMethod("plants 24".tr(), isDark),
                normalTextMethod("plants 25".tr(), isDark),
                normalTextMethod("plants 26".tr(), isDark),
                pandMethod("plants 27".tr(), isDark),
                normalTextMethod("plants 28".tr(), isDark),
                normalTextMethod("plants 29".tr(), isDark),
                SizedBox(height: 10)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isDark ? Colors.black : Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black, spreadRadius: 3),
              ],
            ),
            child: Column(
              children: [
                titleMethod("Herbal medicine and diabetes".tr(), screenWidth),
                normalTextMethod("diabetes 1".tr(), isDark),
                normalTextMethod("diabetes 2".tr(), isDark),
                SizedBox(height: 10),
                Image.asset(
                  "assets/images/44.jpg",
                  fit: BoxFit.fill,
                ),
                pandMethod("diabetes 3".tr(), isDark),
                normalTextMethod("diabetes 4".tr(), isDark),
                normalTextMethod("diabetes 5".tr(), isDark),
                pandMethod("diabetes 6".tr(), isDark),
                normalTextMethod("diabetes 7".tr(), isDark),
                pandMethod("diabetes 8".tr(), isDark),
                normalTextMethod("diabetes 9".tr(), isDark),
                SizedBox(height: 10)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isDark ? Colors.black : Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black, spreadRadius: 3),
              ],
            ),
            child: Column(
              children: [
                titleMethod("diabetes 10".tr(), screenWidth),
                normalTextMethod("diabetes 11".tr(), isDark),
                normalTextMethod("diabetes 12".tr(), isDark),
                SizedBox(height: 10),
                Image.asset(
                  "assets/images/45.jpg",
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Row titleMethod(String title, double screenWidth) {
    return Row(
      children: [
        // Expanded(
        //   child: SizedBox(
        //       // width: screenWidth / 2,
        //       ),
        // ),
        Container(
            margin: EdgeInsets.all(7),
            padding: EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.amber),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, color: Colors.black),
            )),
      ],
    );
  }

  Container normalTextMethod(String mytext, bool isDark) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Text(mytext,
          textAlign: TextAlign.start,
          style: TextStyle(color: isDark ? Colors.white : Colors.black)),
    );
  }

  Container pandMethod(String text, bool isDark) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 17,
              color: isDark ? Colors.white : Color.fromARGB(255, 19, 6, 94),
              //  color: ,
              fontWeight: FontWeight.bold),
        ));
  }
}

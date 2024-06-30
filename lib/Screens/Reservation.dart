import 'package:clinics/Screens/Home.dart';
import 'package:clinics/Screens/tools/myAppBar.dart';
import 'package:clinics/models/clinics.dart';
import 'package:clinics/provider/Clinics_Reservations.dart';
import 'package:clinics/provider/profileProvider.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Reservation extends StatefulWidget {
  static const screenRoute = '/Booking';
  const Reservation({super.key});

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    List<List<String>> mybooking = [
      [
        "Time: 11:45 on Tuesday".tr(),
        "Specialization: Cardiologist".tr(),
        "Entity: Damage Clinics".tr(),
        "Date: 2/25/2024".tr()
      ],
      [
        "Time: 1:30 on Wednesday".tr(),
        "Specialization: Chest doctor".tr(),
        "Entity: Private doctor".tr(),
        "Date: 2/27/2024".tr()
      ],
      [
        "Time: 9:45 on Thursday".tr(),
        "Specialization: Ophthalmologist".tr(),
        "Entity: Ahl al-Khair Association".tr(),
        "Date: 2/28/2024".tr()
      ],
    ];
    List<all_Reservations> all_reservations =
        Provider.of<Clinics_Reservations_Provider>(context, listen: false)
            .all_reservations;
    bool isThereData = all_reservations.isNotEmpty;
    var screenWidth = MediaQuery.of(context).size.width;
    clinics clinicDetails = Provider.of<ProfileProvider>(context).clinicDetails;
    List<String> specialization = [
      "",
      "General interior".tr(),
      "children's clinic".tr(),
      "Glandular clinic".tr(),
      "Neurological clinic".tr(),
      "Chest clinic".tr(),
      "kidney clinic".tr(),
      "Dermatology clinic".tr(),
      "Women's clinic".tr(),
      "X-ray clinic".tr(),
      "Urology".tr(),
      "Orthopedic surgery".tr(),
      "Dental clinic".tr(),
      "Eye clinic".tr(),
      "Ear clinic".tr(),
      "Orthopedic clinic".tr(),
      "Urology clinic".tr(),
      "Cardiology clinic".tr(),
      "Nebulization sessions".tr(),
      "Kidney dialysis".tr(),
      "ECG".tr(),
      "CT scan".tr(),
    ];
    Future<bool> _onWillPop() async {
      Navigator.of(context).pushReplacementNamed(Home.screenRoute);
      return (true);
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: !isThereData
          ? Center(
              child: Container(
                  height: 200,
                  width: 200,
                  child: Lottie.asset("assets/Animation/6.json",
                      fit: BoxFit.cover)))
          : Scaffold(
              // appBar: myappBar(
              //     "Reservations".tr(), context.locale.languageCode == "ar" ? 25 : 22),
              body: clinicDetails.clinics_type == "1" ||
                      clinicDetails.clinics_type == "2" ||
                      clinicDetails.clinics_type == "3"
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 3 * (screenWidth - 21) / 7,
                                // margin: EdgeInsets.symmetric(horizontal: 6),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  //  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 238, 23, 7),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Text("Patient Name".tr(),
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                    textAlign: TextAlign.center),
                              ),
                              Container(
                                width: 2 * (screenWidth) / 7,
                                margin: EdgeInsets.symmetric(horizontal: 6),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                  //    borderRadius: BorderRadius.circular(10),
                                  color: Colors.black.withOpacity(0.9),
                                ),
                                child: Text(
                                  "Clinic type".tr(),
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: 2 * (screenWidth - 70) / 7,
                                // margin: EdgeInsets.symmetric(horizontal: 6),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  //  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Text("Timing".tr(),
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: all_reservations.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 3 * (screenWidth - 21) / 7,
                                        //margin: EdgeInsets.symmetric(horizontal: 6),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          //  borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  2), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          context.locale.languageCode == "ar"
                                              ? all_reservations[index]
                                                  .Reservations_Person_Name
                                              : all_reservations[index]
                                                  .Reservations_Person_Name_inEnglish,
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black),
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: true,
                                        ),
                                      ),
                                      Container(
                                        width: 2 * (screenWidth) / 7,
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 6),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          // borderRadius: BorderRadius.circular(10),
                                          color: Colors.black,
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  2), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          specialization[int.parse(
                                              all_reservations[index]
                                                  .Relation_Clinic_Type)],
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white),
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: true,
                                        ),
                                      ),
                                      Container(
                                        width: 2 * (screenWidth - 70) / 7,
                                        // margin: EdgeInsets.symmetric(horizontal: 6),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          //  borderRadius: BorderRadius.circular(10),
                                          color: Colors.black,
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  2), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                            all_reservations[index]
                                                .Reservations_Timing_And_Date,
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white),
                                            textAlign: TextAlign.center),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    )
                  : Container(
                      //color: const Color.fromARGB(255, 41, 39, 39),
                      child: ListView.builder(
                        itemCount: mybooking.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            height: 205,
                            width: double.infinity,
                            child: Column(
                              children: [
                                SizedBox(height: 15),
                                Text(
                                  "${mybooking[index][0]}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text("${mybooking[index][1]}",
                                    style: TextStyle(fontSize: 16)),
                                Text("${mybooking[index][2]}",
                                    style: TextStyle(fontSize: 16)),
                                Text("${mybooking[index][3]}",
                                    style: TextStyle(fontSize: 16)),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {},
                                  child:
                                      Text("cancellation of reservation".tr()),
                                  style: ElevatedButton.styleFrom(
                                      // primary: Color.fromARGB(
                                      //     255, 219, 10, 10) // Colors.amber,
                                      ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ),
    );
  }
}

import "package:clinics/Screens/tools/myAppBar.dart";
import "package:clinics/models/clinics.dart";
import "package:clinics/provider/Clinics_Reservations.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class Reservation_InClinic extends StatelessWidget {
  static const screenRoute = '/Reservation_InClinic';
  const Reservation_InClinic({super.key});

  @override
  Widget build(BuildContext context) {
    List<all_Reservations> all_reservations =
        Provider.of<Clinics_Reservations_Provider>(context, listen: false)
            .all_reservations;
    bool isThereData = all_reservations.isNotEmpty;
    var screenWidth = MediaQuery.of(context).size.width;
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
    return Scaffold(
      body: !isThereData
          ? Center(child: CircularProgressIndicator())
          : Column(
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
                            color: Color.fromARGB(255, 238, 23, 7)),
                        child: Text("Patient Name".tr(),
                            style: TextStyle(fontSize: 17, color: Colors.white),
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        width: 2 * (screenWidth) / 7,
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          //    borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.9),
                        ),
                        child: Text(
                          "Clinic type".tr(),
                          style: TextStyle(fontSize: 17, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 2 * (screenWidth - 70) / 7,
                        // margin: EdgeInsets.symmetric(horizontal: 6),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            //  borderRadius: BorderRadius.circular(10),
                            color: Colors.black),
                        child: Text("Timing".tr(),
                            style: TextStyle(fontSize: 17, color: Colors.white),
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
                                    color: const Color.fromARGB(
                                        255, 214, 193, 191)),
                                child: Text(
                                  context.locale.languageCode == "ar"
                                      ? all_reservations[index]
                                          .Reservations_Person_Name
                                      : all_reservations[index]
                                          .Reservations_Person_Name_inEnglish,
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: true,
                                ),
                              ),
                              Container(
                                width: 2 * (screenWidth) / 7,
                                margin: EdgeInsets.symmetric(horizontal: 6),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(10),
                                    color: Colors.black.withOpacity(0.4)),
                                child: Text(
                                  specialization[int.parse(
                                      all_reservations[index]
                                          .Relation_Clinic_Type)],
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: true,
                                ),
                              ),
                              Container(
                                width: 2 * (screenWidth - 70) / 7,
                                // margin: EdgeInsets.symmetric(horizontal: 6),
                                padding: EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                    //  borderRadius: BorderRadius.circular(10),
                                    color: Colors.black.withOpacity(0.7)),
                                child: Text(
                                    all_reservations[index]
                                        .Reservations_Timing_And_Date,
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}

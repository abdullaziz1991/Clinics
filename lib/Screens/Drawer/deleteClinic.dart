import 'package:clinics/Screens/Home.dart';
import 'package:clinics/models/clinics.dart';
import 'package:clinics/provider/allClinicsProvider.dart';
import 'package:clinics/provider/clinicProvider.dart';
import 'package:clinics/provider/dataProvider.dart';
import 'package:clinics/provider/deleteProvider.dart';
import 'package:clinics/provider/profileProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clinics/Screens/tools/myAppBar.dart';

class deleteClinic extends StatefulWidget {
  static const screenRoute = '/deleteClinic';
  const deleteClinic({super.key});

  @override
  State<deleteClinic> createState() => _deleteClinicState();
}

class _deleteClinicState extends State<deleteClinic> {
  @override
  void initState() {
    // Provider.of<dataProvider>(context, listen: false).getData();
    // Provider.of<clinicProvider>(context, listen: false).getClinicsData();
    //  Provider.of<allClinicsProvider>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isLanguageArabic = context.locale.languageCode == "ar";
    var screenWidth = MediaQuery.of(context).size.width;
    List<allClinics> allclinic = [];
    allclinic = Provider.of<clinicProvider>(context).allclinics;
    clinics clinicDetails = Provider.of<ProfileProvider>(context).clinicDetails;
    // print(clinicDetails.clinic_name);
    List<allClinics> searchlist = [];
    for (int i = 1; i < allclinic.length; i++) {
      if ((allclinic[i].clinic_Name == clinicDetails.clinic_name)) {
        // print(allclinic[i].id);
        searchlist.add(allclinic[i]);
      }
    }
    Future<bool> _onWillPop() async {
      Navigator.of(context).pushReplacementNamed(Home.screenRoute);
      return (true);
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: myappBar(
            "Delete clinic".tr(), 1, isLanguageArabic, isDark, context),
        body: ListView.builder(
            itemCount: searchlist.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 16, right: 16, left: 16, bottom: 8),
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black, width: 2),
                      // gradient: LinearGradient(
                      //   colors: [Colors.orange, Color.fromARGB(255, 163, 7, 7)],
                      //   begin: Alignment.topRight,
                      //   end: Alignment.bottomLeft,
                      //   stops: [0, 0.7],
                      // ),
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            context.locale.languageCode == "ar"
                                ? "${"${searchlist[index].clinic_Name}"}"
                                : "${"${searchlist[index].clinic_name_in_english}"}",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber,
                          ),
                          padding: EdgeInsets.all(7),
                          child: Wrap(
                            children: [
                              Text(
                                "The specialization".tr() + " : ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                context.locale.languageCode == "ar"
                                    ? "${"${searchlist[index].specialization}"}"
                                    : "${"${searchlist[index].specialization_in_english}"}",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(children: [
                          Expanded(
                              flex: 3,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      //color: Colors.grey,
                                      child: Text(
                                        "the Cost".tr() +
                                            " : " +
                                            "${"${searchlist[index].clinics_reward}"}",
                                        //"التكلفة : ${"${searchlist[index].clinics_reward}"}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        //color: Colors.amber,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("The address".tr() + " : ",
                                                //  "العنوان : ${"${searchlist[index].clinics_place}"}",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            Flexible(
                                              child: Text(
                                                  context.locale.languageCode ==
                                                          "ar"
                                                      ? "${"${searchlist[index].clinics_place}"}"
                                                      : "${"${searchlist[index].clinics_place_in_english}"}",
                                                  //  "العنوان : ${"${searchlist[index].clinics_place}"}",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ],
                                        )),
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        //color: Colors.amber,
                                        child: Text(
                                            "Evaluation".tr() +
                                                " : " +
                                                "${"${searchlist[index].clinic_level}"}",
                                            style: TextStyle(
                                                color: Colors.white))),
                                    SizedBox(height: 10),
                                  ])),
                          Expanded(
                              flex: 2,
                              child: Image.network(
                                "http://192.168.1.104/abdulaziz/images/${searchlist[index].clinic_Image}",
                                fit: BoxFit.cover,
                              )),
                        ]),
                      ],
                    ),
                  ),
                  Positioned(
                    child: InkWell(
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                        size: 30,
                      ),
                      onTap: () {
                        print("searchlist[index].id ++++++++++++++++++++");
                        print(searchlist[index].relation_clinic_name);
                        print(searchlist[index].relation_clinic_specialization);
                        Provider.of<deleteProvider>(context, listen: false)
                            .deleteData(
                                searchlist[index].relation_clinic_name,
                                searchlist[index]
                                    .relation_clinic_specialization);
                      },
                    ),
                    top: 25,
                    left: screenWidth - 55,
                  )
                ],
              );
            }),
      ),
    );
  }
}

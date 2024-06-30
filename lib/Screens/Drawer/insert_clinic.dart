import 'package:clinics/Screens/Home.dart';
import 'package:clinics/models/clinics.dart';
import 'package:clinics/provider/dataProvider.dart';
import 'package:clinics/provider/profileProvider.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clinics/Screens/tools/myAppBar.dart';

class insertClinic extends StatefulWidget {
  static const screenRoute = '/insertClinic';
  const insertClinic({super.key});

  @override
  State<insertClinic> createState() => _insertClinicState();
}

TextEditingController TheCost = TextEditingController();

class _insertClinicState extends State<insertClinic> {
  List<String> days = [
    "Saturday".tr(),
    "Sunday".tr(),
    "Monday".tr(),
    "Tuesday".tr(),
    "Wednesday".tr(),
    "Thursday".tr(),
    "Friday".tr(),
  ];
  List<String> days_inArabic = [
    "السبت",
    "الاحد",
    "الاثنين",
    "الثلاثاء",
    "الاربعاء",
    "الخميس",
    "الجمعة",
  ];
  List<String> days_inEnglish = [
    "Saturday",
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
  ];
  List<String> hours = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];
  List<String> period = ["morning".tr(), "evening".tr()];
  List<String> period_inArabic = ["صباحا", "مساء"];
  List<String> period_inEnglish = ["morning", "evening"];
  late clinics clinicDetails;
  List<String> all_ids = [];
  //var xx = false;
  //var name_of_the_entity = "عيادات التآلف";
  var clinic_specialization = "General interior".tr();
  var the_day = "Saturday".tr();
  var Clinic_start_time = "1";
  var Clinic_end_time = "2";
  var Clinic_start_period = "morning".tr();
  var Clinic_end_period = "morning".tr();
  int specialization_id = 1,
      day_id = 1,
      Clinic_start_period_id = 0,
      Clinic_end_period_id = 0;

// Saturday.
// الأحد Sunday.
// الإثنين Monday.
// الثلاثاء Tuesday.
// الأربعاء Wednesday.
// الخميس Thursday.
// الجمعة Friday.

  // List<Widget> bodyElements = [];
  // int num = 0;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isLanguageArabic = context.locale.languageCode == "ar";
    // List all_Specializations =
    //     Provider.of<dataProvider>(context, listen: false).all_Specializations;
    print(the_day);
    print(days);

    clinicDetails = Provider.of<ProfileProvider>(context).clinicDetails;
    List<String> specializationData =
        Provider.of<dataProvider>(context).all_Specializations;
    List<String> specializationData_in_english =
        Provider.of<dataProvider>(context).all_Specializations_in_english;
    // print(specializationData);
    //print(specializationData);

    all_ids = Provider.of<dataProvider>(context).get_all_ids;
    var screenWidth = MediaQuery.of(context).size.width;
    Future<bool> _onRefresh() async {
      // monitor network fetch

      // if (all_ids == null) {
      //   await Future.delayed(Duration(milliseconds: 2000));
      //   return false;
      // }

      return true;
      // if failed,use refreshFailed()
    }

    Future<bool> _onWillPop() async {
      Navigator.of(context).pushReplacementNamed(Home.screenRoute);
      return (true);
    }

    return //_onRefresh() != null ?
        WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar:
            myappBar("Add a clinic".tr(), 1, isLanguageArabic, isDark, context),
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      //height: 40,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber),
                      child: Text("Clinic name".tr(),
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                          context.locale.languageCode == "ar"
                              ? clinicDetails.clinic_name
                              : clinicDetails.clinic_name_in_english,
                          style: TextStyle(
                              fontSize: 17,
                              color: isDark ? Colors.white : Colors.black),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
            dropDownMethod(
                "Clinic type".tr(),
                screenWidth,
                clinic_specialization,
                context.locale.languageCode == "ar"
                    ? specializationData
                    : specializationData_in_english), // specialization
            Container(
                margin: EdgeInsets.all(2),
                child: Column(
                  children: [
                    dropDownMethod(
                        "Clinic day".tr(), screenWidth, the_day, days),
                    timeMethod("Start of clinic time".tr(), screenWidth,
                        Clinic_start_time, hours, Clinic_start_period, period),
                    timeMethod("End of clinic time".tr(), screenWidth,
                        Clinic_end_time, hours, Clinic_end_period, period),
                  ],
                )),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      //height: 40,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber),
                      child: Text("the Cost".tr(),
                          style: TextStyle(
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: TheCost,
                      // onChanged: (String val) {
                      //   myemail = val;
                      //   print(myemail);
                      //    منشان يحفظ المعلومات المدخلة
                      // },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "Email can't to be larger than 100 letter";
                        }
                        if (val.length < 2) {
                          return "Email can't to be less than 2 letter";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          // prefixIcon: Icon(
                          //   Icons.person,
                          //   color: Colors.orange,
                          // ),
                          hintText: "Write the cost".tr(),
                          hintStyle: TextStyle(
                              color: isDark ? Colors.white : Colors.black)
                          // labelText: "Email".tr(),
                          // border: OutlineInputBorder(
                          //     // borderRadius: BorderRadius.circular(25),
                          //     // borderSide: BorderSide(width: 1),
                          //     ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 219, 10, 10)),
                  child: Text("Add a clinic appointment".tr(),
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center),
                ),
              ),
              onTap: () async {
                //print("data ++++++++++++++++++++++++++");
                //   print(all_ids[specialization_id]);
                // getUserInformation();
                print("object ++++++++++++++++++++++++++");
                print(clinicDetails.id_names);
                print(clinicDetails.clinics_type);
                print(all_ids[specialization_id]);
                print(day_id);
                print(Clinic_start_time);
                print(Clinic_start_period_id);
                print(Clinic_end_time);
                print(Clinic_end_period_id);
                print(Clinic_end_period_id);

                print(TheCost.text.toString());
                print("Clinic_end_period ++++++++++++++++++++++++++++");

                if ((int.parse(Clinic_end_time) >
                            int.parse(Clinic_start_time) &&
                        Clinic_start_period == Clinic_end_period) ||
                    Clinic_start_period != Clinic_end_period) {
                  var formData = FormData.fromMap({
                    'relation_clinic_name': clinicDetails.id_names,
                    'clinics_type': clinicDetails.clinics_type,
                    'relation_clinic_specialization':
                        all_ids[specialization_id],
                    // 'day_of_clinic': the_day, //days_inArabic[day_id]
                    //   'day_of_clinic_inEnglish': days_inEnglish[day_id],
                    'day_number': day_id,
                    'Clinic_start_time': Clinic_start_time,
                    'Clinic_start_period':
                        Clinic_start_period_id, // Clinic_start_period,
                    // 'Clinic_start_period_inEnglish': Clinic_start_period,
                    'Clinic_end_time': Clinic_end_time,
                    'Clinic_end_period': Clinic_end_period_id,
                    'Clinic_Cost': TheCost.text.toString(),
                  });
                  var response = await Dio().post(
                      'http://192.168.1.104/abdulaziz/insert/insertLast2.php',
                      //'http://192.168.176.76/abdulaziz/insert/insertLast2.php',
                      data: formData);
                  if (response.statusCode == 200) {
                    print("Clinic Uploaded");
                    print(
                        'Operation uploaded - server response: ${response.statusCode}');
                    // print(response);
                  } else {
                    print(
                        'Operation not uploaded - server response: ${response.statusCode}');
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "The clinic's end time should be after its start".tr()),
                  ));
                }
              },
            )
          ],
        ),
      ),
    );
    // : Center(
    //     child: CircularProgressIndicator(),
    // );
  }

////////////////////////////////////////////////////////////////////////////////////////////////////
  Padding dropDownMethod(
      String title, double screenWidth, String initValue, List<String> list) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              //height: 40,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.amber),
              child: Text(title,
                  style: TextStyle(fontSize: 17), textAlign: TextAlign.center),
            ),
          ),
          Expanded(
            flex: 3,
            child: DropdownButton<String>(
              value: initValue,
              hint: Container(
                alignment: Alignment.centerRight,
                width: 180,
                // child: Text(
                //   "Hint text",
                // ),
              ), // textAlign: TextAlign.end

              // items: list.map((String value) {
              //   return new DropdownMenuItem<String>(
              //     value: value,
              //     child: new Text(value),
              //   );
              // }).toList(),
              onChanged: (Object? value) {
                setState(() {
                  //  savePref(value.toString());
                  //getSavedPref();
                  // String variable = value.toString();
                  if (title == "Clinic type".tr()) {
                    clinic_specialization = value.toString();
                    specialization_id = list.indexOf(value.toString());
                  }
                  if (title == "Clinic day".tr()) {
                    the_day = value.toString();
                    day_id = list.indexOf(value.toString());
                    print(the_day);
                  }
                  if (title == "Start of clinic time".tr()) {
                    Clinic_start_time = value.toString();
                  }
                  if (title == "End of clinic time".tr()) {
                    Clinic_end_time = value.toString();
                  }
                });
              },
              selectedItemBuilder: (BuildContext context) {
                return list.map<Widget>((String item) {
                  return Container(
                      alignment: Alignment.center,
                      width: screenWidth / 2,
                      child: Text(item, textAlign: TextAlign.end));
                }).toList();
              },
              items: list.map((String item) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.topRight,
                  child: Text(item),
                  value: item,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Padding timeMethod(String title, double screenWidth, String initValue,
      List<String> list, String initValue2, List<String> list2) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 5, bottom: 5, left: 5),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              //height: 40,
              padding: EdgeInsets.all(5),
              //margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.amber),
              child: Text(title,
                  style: TextStyle(fontSize: 17), textAlign: TextAlign.center),
            ),
          ),
          Expanded(
            flex: 3,
            child: DropdownButton<String>(
              value: initValue,
              hint: Container(
                  //  alignment: Alignment.centerRight,
                  //  width: 180,
                  // child: Text(
                  //   "Hint text",
                  // ),
                  ), // textAlign: TextAlign.end
              onChanged: (Object? value) {
                setState(() {
                  //  savePref(value.toString());
                  //getSavedPref();
                  // String variable = value.toString();

                  if (title == "Start of clinic time".tr()) {
                    Clinic_start_time = value.toString();
                  }
                  if (title == "End of clinic time".tr()) {
                    Clinic_end_time = value.toString();
                  }
                });
              },
              selectedItemBuilder: (BuildContext context) {
                return list.map<Widget>((String item) {
                  return Container(
                      alignment: Alignment.center,
                      width: screenWidth / 3 - 50,
                      child: Text(item, textAlign: TextAlign.end));
                }).toList();
              },
              items: list.map((String item) {
                return DropdownMenuItem<String>(
                  // alignment: Alignment.topRight,
                  child: Text(item),
                  value: item,
                );
              }).toList(),
            ),
          ),
          Expanded(
            flex: 3,
            child: DropdownButton<String>(
              value: initValue2,
              hint: Container(
                  //alignment: Alignment.topRight,
                  // width: 180,
                  // child: Text(
                  //   "Hint text",
                  // ),
                  ), // textAlign: TextAlign.end
              onChanged: (Object? value) {
                setState(() {
                  //  savePref(value.toString());
                  //getSavedPref();
                  // String variable = value.toString();

                  if (title == "Start of clinic time".tr()) {
                    Clinic_start_period = value.toString();
                    Clinic_start_period_id = list2.indexOf(value.toString());
                    print(Clinic_start_period_id);
                  }
                  if (title == "End of clinic time".tr()) {
                    Clinic_end_period = value.toString();
                    Clinic_end_period_id = list2.indexOf(value.toString());
                    print(Clinic_end_period_id);
                  }
                });
              },
              selectedItemBuilder: (BuildContext context) {
                return list2.map<Widget>((String item) {
                  return Container(
                      alignment: Alignment.center,
                      width: screenWidth / 3 - 50,
                      child: Text(item, textAlign: TextAlign.right));
                }).toList();
              },
              items: list2.map((String item) {
                return DropdownMenuItem<String>(
                  //alignment: Alignment.topRight,
                  child: Text(item),
                  value: item,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

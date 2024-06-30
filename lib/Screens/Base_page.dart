import 'package:clinics/Screens/Herbal_Treatment.dart';

import 'package:clinics/Screens/psychological.dart';

import 'package:clinics/models/clinics.dart';
import 'package:clinics/Screens/surgery.dart';

import 'package:clinics/provider/clinicProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// بدي احول الصورة لفكتر وبعدا اشيل خلفية الصورة
class base_page extends StatefulWidget {
  const base_page({super.key});

  @override
  State<base_page> createState() => _base_pageState();
}

class _base_pageState extends State<base_page> {
  List<String> Clinics_Informations = [];
  //List<String> allClinics_date = [];
  List<dynamic> value = [];
  List<clinics_info> theList = [];
  //List<dynamic> list = [];
  //List<dynamic> list
  //List<dynamic> _value; // Instance variable.

  // func() async {
  //   value = await getData(1, 'specialization');
  //   print("_value ++++++++++++++");
  //   print(value.toString());
  //   print("_value ________________");
  //   func2() {}
  // }

  @override
  initState() {
    //func();
    //List<dynamic> value = await getData(1, 'specialization');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<program_Interface> Clinics_Data = [
      program_Interface(
          clinic_name: "Clinics and Hospitals".tr(),
          clinics_image: "assets/images/1.jpg"),
      program_Interface(
          clinic_name: "Private Doctor".tr(),
          clinics_image: "assets/images/2.jpg"),

      program_Interface(
          clinic_name: "Psychological Counseling".tr(),
          clinics_image: context.locale.languageCode == "ar"
              ? "assets/images/31.jpg"
              : "assets/images/46.jpg"),
      program_Interface(
          clinic_name: "Herbal Treatment".tr(),
          clinics_image: "assets/images/41.jpg"),
      program_Interface(
          clinic_name: "Needs surgery".tr(),
          clinics_image: "assets/images/7.jpg"),
      program_Interface(
          clinic_name: "CT scan".tr(), clinics_image: "assets/images/52.jpg"),
      // clinics(clinics_name: "الاعدادات", clinics_image: "assets/images/8.png"),
    ];
    return GridView.builder(
      shrinkWrap: true,
      itemCount: Clinics_Data.length, //
      //reverse: true,
      // منشان ترتيب الرسائل من فوق لتحت
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      // itemCount: frinds_data.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        /// يحدد عدد العناصر التي يمكننا وضعها في كل سطر
        maxCrossAxisExtent: 350, // 350,
        // crossAxisCount: 1,
        //mainAxisExtent: 350,

        /// عرض كل عنصر
        childAspectRatio: 1,

        /// النسبة اعرض على الارتفاع
        mainAxisSpacing: 5,

        /// البعد بين العناصر
        crossAxisSpacing: 5,
      ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () async {
            // Navigator.pushReplacementNamed(
            //     context, Clinics_Details.screenRoute);
            if (index == 0) {
              // showSearch(
              //     context: context,
              //     delegate: clinics_Search(mylist: Clinics_Information));
              print("Theme ----------------------------------");
              print(Theme.of(context).brightness == Brightness.dark);
              print("Theme +++++++++++++++++++++++++++++++++++");
              showSearch(
                  context: context,
                  delegate: clinics_Search(
                      clinicType: "1", gradient: [Colors.white, Colors.black]));
            }
            if (index == 1) {
              showSearch(
                  context: context,
                  delegate: clinics_Search(clinicType: "2", gradient: [
                    Colors.white,
                    Color.fromARGB(255, 12, 17, 85)
                  ]));
            }
            if (index == 2) {
              Navigator.pushReplacementNamed(
                  context, Psychological.screenRoute);
            }
            if (index == 3) {
              Navigator.pushReplacementNamed(
                  context, Herbal_Treatment.screenRoute);
            }
            if (index == 4) {
              Navigator.pushReplacementNamed(context, surgery.screenRoute);
            }
            if (index == 5) {
              // Navigator.pushReplacementNamed(context, CT_Scan.screenRoute);
              showSearch(
                  context: context,
                  delegate: clinics_Search(clinicType: "3", gradient: [
                    Colors.white,
                    Color.fromARGB(255, 180, 118, 3)
                  ]));
            }
          },
          child: Stack(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Image.asset(
                      Clinics_Data[index].clinics_image,
                      width: 350,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2)),
                      alignment: Alignment.center,
                      //color: Colors.amber,
                      height: 350,
                      width: 350,
                      child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: double.infinity,
                          color: Colors.black38,
                          child: Text(
                            // "title" + (index + 1).toString().tr(),
                            //"title1".tr(),
                            Clinics_Data[index].clinic_name.tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    // Image.network(
                    //   "${allUsersInformaions[index].image}",
                    //   fit: BoxFit.fill,
                    //   height: 200,
                    //   width: double.infinity,
                    // ),
                  ],
                )),
          ]),
        );
      },
    );
  }

  selectData(int number, String type) async {
    //getData();

    // final list = await getData();
    final list = [];
    //List<dynamic> list =
    List<dynamic> data = [];
    data.add(list[0]);

    print(list);
    if (number == 1 && type == 'specialization') {
      for (int i = 1; i < list.length; i++) {
        if (list[i]["specialization"] != list[i - 1]["specialization"]) {
          data.add(list[i]);
        }
      }
    }
    if (number == 2) {
      for (int i = 1; i < list.length; i++) {
        if (list[i]["id_specialization"] == type) {
          data.add(list[i]);
        }
      }
    }
    print(data);
    // print("_______________________________________________________");
    return data;
  }
}

// Future getData() async {
//   //var url = Uri.parse("http://192.168.1.104/abdulaziz/select/select.php");
//   var url = Uri.parse("http://192.168.144.76/abdulaziz/select/select.php");

//   http.Response response = await http.post(url);
//   var responseBody = jsonDecode(response.body);
//   print(responseBody);
//   final list = responseBody;
//   return list;
// }

class clinics_Search extends SearchDelegate<String> {
  String clinicType;
  List<Color> gradient;
  clinics_Search({required this.clinicType, required this.gradient});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<allClinics> allclinic =
        Provider.of<clinicProvider>(context).allclinics;
    List<allClinics> searchlist = [], data = [];

    bool isThereData = allclinic.isNotEmpty;
    print(isThereData);
    //print(allclinic);
    //print(isThereData);
    print("isThereData +++++++++++++++");
    if (isThereData) {
      if (allclinic[0].clinics_type == clinicType) {
        data.add(allclinic[0]);
      }

      for (int i = 1; i < allclinic.length; i++) {
        if (((allclinic[i].clinic_Name != allclinic[i - 1].clinic_Name) ||
                (allclinic[i].relation_clinic_specialization !=
                    allclinic[i - 1].relation_clinic_specialization)) &&
            allclinic[i].clinics_type == clinicType) {
          data.add(allclinic[i]);
          print("data[i].clinic_Name ++++++++++++++++++++++++");
          print(allclinic[i].clinic_Name);
          // print(allclinic[i].day_of_clinic);
          // print(data.length);
        }
      }
      searchlist = query.isEmpty
          ? data
          : data.where((element) {
              return element.specialization.contains(query) ||
                  element.specialization_in_english.contains(query);
            }).toList();
    }

    // //print(data);
    // for (int i = 0; i < allclinic.length; i++) {
    //   print("data[i].clinic_Name ++++++++++++++++++++++++");
    //   print(allclinic[i].clinic_Name);
    // }
    //double rating = 0.0;
    return !isThereData
        ? Center(
            child: Container(
                height: 200,
                width: 200,
                child:
                    Lottie.asset("assets/Animation/6.json", fit: BoxFit.cover)))
        : ListView.builder(
            itemCount: searchlist.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      gradient: LinearGradient(
                        colors: gradient,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 1],
                        // tileMode: TileMode.clamp
                        //    begin: Alignment.topLeft,
                        // end: Alignment.bottomRight,
                        // colors: [
                        //   Colors.black.withOpacity(0),
                        //   Colors.black.withOpacity(0.8),
                        // ],
                        // stops: [0.3, 1],
                      ),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          context.locale.languageCode == "ar"
                              ? "${"${searchlist[index].clinic_Name}"}"
                              : "${"${searchlist[index].clinic_name_in_english}"}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 204, 154, 2),
                        ),
                        padding: EdgeInsets.all(7),
                        child: Wrap(
                          children: [
                            Text(
                              "The specialization".tr() + " : ",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(context.locale.languageCode == "ar"
                                ? "${"${searchlist[index].specialization}"}"
                                : "${"${searchlist[index].specialization_in_english}"}"),
                          ],
                        ),
                        //  "الاختصاص : ${"${searchlist[index].specialization}"}"),
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
                                          "${"${searchlist[index].Clinic_Cost}"}",
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
                                          // "التقييم : ${"${searchlist[index].clinic_level}"}",
                                          style:
                                              TextStyle(color: Colors.white))),
                                  InkWell(
                                    child:
                                        ratingMethod(searchlist, index, true),
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                  "Clinic evaluation".tr(),
                                                  //"تقييم العيادة",
                                                  textAlign: TextAlign.start),
                                              content: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text("Rate this clinic".tr()
                                                      // "قم بتقييم هذه العيادة"
                                                      ),
                                                  SizedBox(height: 10),
                                                  ratingMethod(
                                                      data, index, false),
                                                ],
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("OK".tr()),
                                                )
                                              ],
                                            );
                                          });
                                    },
                                  ),
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
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        var date = DateTime.now();
                        var mydate;
                        return AlertDialog(
                          backgroundColor: Colors.black38,
                          content: Container(
                            margin: EdgeInsets.symmetric(horizontal: 6),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                color: Color.fromARGB(255, 31, 28, 28)),
                            child: Text("Available Appointments".tr(),
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                          actions: [
                            appointmentMethod(
                                allclinic,
                                searchlist[index].specialization,
                                searchlist[index].clinic_Name,
                                index,
                                date,
                                mydate,
                                context,
                                context.locale.languageCode)
                          ],
                        );
                      });
                },
              );
            });
  }

  RatingBar ratingMethod(
      List<allClinics> data, int index, bool ignoreGestures) {
    return RatingBar.builder(
      ignoreGestures: ignoreGestures,
      itemSize: 25,
      initialRating: double.parse(data[index].clinic_level),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      updateOnDrag: true,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) =>
          // DecoratedIcon(
          //   icon: Icon(
          //     Icons.star,
          //     color: Colors.amber,
          //   ),
          //   decoration: IconDecoration(
          //       border:
          //           IconBorder(color: Colors.white)),
          // ),
          Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Column appointmentMethod(
      List<allClinics> allclinics,
      String Specialization,
      String clinic_Name,
      int index,
      DateTime date,
      mydate,
      context,
      String locale) {
    List<allClinics> data = [];
    //print(allclinics[i].specialization);
    // print(Specialization);
    // print(clinic_Name);
    // print(allclinics[i].clinic_Name);
    // print(allclinics[i].Clinic_end_time);
    //print("allclinics[i].Clinic_end_time +++++++++++++");
    for (int i = 0; i < allclinics.length; i++) {
      print("__________________________");
      if (allclinics[i].specialization == Specialization &&
          allclinics[i].clinic_Name == clinic_Name) {
        data.add(allclinics[i]);
      }
    }
    List<String> days_inEnglish = [
      "Saturday",
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
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
    List<String> period_inArabic = ["صباحا", "مساء"];
    List<String> period_inEnglish = ["Morning", "Evening"];
    List<Widget> textWidgetList = [];
    // List list = allclinics.where((element) {
    //   return element['id_specialization'] == index + 1;
    // }).toList();
    for (int i = 0; i < data.length; i++) {
      textWidgetList.add(
        InkWell(
          child: Container(
            margin: EdgeInsets.all(7),
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 204, 154, 2)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              locale == "ar"
                  ? "${days_inArabic[int.parse(data[i].day_number)]}  من ${data[i].Clinic_start_time} ${period_inArabic[int.parse(data[i].Clinic_start_period)]} حتى ${data[i].Clinic_end_time} ${period_inArabic[int.parse(data[i].Clinic_end_period)]}"
                  : "${days_inEnglish[int.parse(data[i].day_number)]}  from ${data[i].Clinic_start_time} ${period_inEnglish[int.parse(data[i].Clinic_start_period)]} until ${data[i].Clinic_end_time} ${period_inEnglish[int.parse(data[i].Clinic_end_period)]}",
              //"${days_inEnglish[int.parse(data[i].day_number)]} من ${data[i].Clinic_start_time} ${data[i].Clinic_start_period} حتى ${data[i].Clinic_end_time} ${data[i].Clinic_end_period}",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.start,
            ),
          ),
          onTap: () async {
            print(data[i].Clinic_start_time);
            List<int> the_prohibited_days2 = [];
            for (int index2 = 1; index2 < 8; index2++) {
              if (index2 != data[i].day_number) {
                // || index2 != 5
                the_prohibited_days2.add(index2);
              }
            }
            // print(data[i]['date_day_in_english']);
            // List<String> the_prohibited_days = [];
            // for (int i = 0; i < mylist2.length; i++) {
            //   if (mylist2[i]['date_day_in_english'] != "") {
            //     the_prohibited_days.add(mylist2[i]['date_day_in_english']);
            //   }
            // }
            //print(the_prohibited_days);
            // print(date
            //     .toString()); // prints something like 2019-12-10 10:02:22.287949
            // print(DateFormat('EEEE').format(date)); // prints Tuesday
            // print(DateFormat('EEEE, d MMM, yyyy')
            //     .format(date)); // prints Tuesday, 10 Dec, 2019
            // print(DateFormat('h:mm a').format(date)); // prints 10:02 AM
            // print(the_prohibited_days);

            // var days = {
            //   1: "Monday",
            //   2: "Tuesday",
            //   3: "Wednesday",
            //   4: "Thursday",
            //   5: "Friday",
            //   6: "Saturday",
            //   7: "Sunday",
            // };
            // int desired_day = 0;
            // for (int iday = 1; iday < 8; iday++) {
            //   if (days[iday] == mylist2[i]['date_day_in_english']) {
            //     // print(days[i] == DateFormat('EEEE').format(date));
            //     desired_day = iday;
            //   }
            // }
            // print(desired_day);
            DateTime? newDate = await showDatePicker(
              context: context,
              //   initialDate: date,
              firstDate: DateTime(2022),
              lastDate: DateTime(2100),
              // initialDate: DateTime(DateTime.now().year, DateTime.now().month,
              //    // mylist2[i]['date_day_number'])
              // DateTime.now().day + 1),

              initialDate: date.weekday == DateTime.friday // or 5
                  ? DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day + 1)
                  : date,
              // initialDate: DateTime(DateTime.now().year, DateTime.now().month,
              //     DateTime.now().day + desired_day - 2),

              selectableDayPredicate: (DateTime val) =>
                  val.weekday == DateTime.friday // or 5
                      ? false
                      : true,
              // selectableDayPredicate: (DateTime val) =>

              //     // val.weekday == the_prohibited_days[1] ||
              //     //         val.weekday == the_prohibited_days[2] ||
              //     //         val.weekday == the_prohibited_days[3] ||
              //     //         val.weekday == the_prohibited_days[4] ||
              //     //         val.weekday == the_prohibited_days[5] ||
              //     //         val.weekday == the_prohibited_days[6]
              //         // or 5 =DateTime.friday
              //         ? false
              //         : true,
              //  || val.weekday == DateTime.thursday
            );
            DateTime selected_Date = newDate as DateTime;

            print(DateFormat('EEEE').format(selected_Date));
            // print(the_prohibited_days2);
            // print(DateTime.now().day);

            // bool istrue = false;
            // for (int i = 0; i < the_prohibited_days.length; i++) {
            //   if (the_prohibited_days[i] ==
            //       DateFormat('EEEE').format(selected_Date)) {
            //     istrue = true;
            //     break;
            //   }
            // }
            //  print(istrue);
            print("istrue ++++++++++++++++++++++++++++");
            mydate =
                "${selected_Date.year}/${selected_Date.month}/${selected_Date.day}";
            Navigator.of(context).pop();
            // if (newDate != null) {
            //   showDialog(
            //     context: context,
            //     builder: (context) {
            //       var date = DateTime.now();
            //       var mydate;
            //       return AlertDialog(
            //         backgroundColor: Colors.black38,
            //         content: Container(
            //           margin: EdgeInsets.symmetric(horizontal: 6),
            //           padding:
            //               EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               border: Border.all(color: Colors.white, width: 2),
            //               color: Color.fromARGB(255, 31, 28, 28)),
            //           child: Text("إحجز موعد",
            //               style: TextStyle(fontSize: 17, color: Colors.white),
            //               textAlign: TextAlign.center),
            //         ),
            //         actions: [
            //           // appointmentTimeMethod(
            //           //     snapshot, index, date, mydate, context)
            //         ],
            //       );
            //     },
            //   );

            // }
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: istrue
            //       ? Container(
            //           //height: ScreenHight / 6.8,
            //           child: Center(
            //             child: Column(
            //               children: [
            //                 Container(
            //                   alignment: Alignment.center,
            //                   width: double.infinity,
            //                   padding: EdgeInsets.all(5),
            //                   decoration: BoxDecoration(
            //                       border:
            //                           Border.all(color: Colors.white, width: 2),
            //                       // borderRadius: BorderRadius.only(
            //                       //   topLeft: Radius.circular(15),
            //                       //   topRight: Radius.circular(15),
            //                       // ),
            //                       color: Colors.black),
            //                   child: Text(
            //                     "تم حجز الموعد ",
            //                     style: TextStyle(
            //                         color: Colors.white,
            //                         fontWeight: FontWeight.bold),
            //                   ),
            //                 ),
            //                 // SizedBox(height: 5),
            //                 Divider(
            //                   height: 2,
            //                 ),
            //                 Container(
            //                   decoration: BoxDecoration(
            //                       border:
            //                           Border.all(color: Colors.white, width: 2),
            //                       color: Colors.black),
            //                   alignment: Alignment.center,
            //                   width: double.infinity,
            //                   padding: EdgeInsets.all(5),
            //                   child: Text(
            //                     " بتاريخ :  $mydate",
            //                     style: TextStyle(
            //                         color: Colors.white,
            //                         fontWeight: FontWeight.bold),
            //                   ),
            //                 ),
            //                 //  SizedBox(height: 5),
            //                 Divider(
            //                   height: 2,
            //                 ),
            //                 Container(
            //                   alignment: Alignment.center,
            //                   width: double.infinity,
            //                   padding: EdgeInsets.all(5),
            //                   decoration: BoxDecoration(
            //                       border:
            //                           Border.all(color: Colors.white, width: 2),
            //                       // borderRadius: BorderRadius.only(
            //                       //   bottomLeft: Radius.circular(15),
            //                       //   bottomRight: Radius.circular(15),
            //                       // ),
            //                       color: Colors.black),
            //                   child: Text(
            //                     "الساعة :  11:45",
            //                     style: TextStyle(
            //                         color: Colors.white,
            //                         fontWeight: FontWeight.bold),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         )
            //       : Container(
            //           decoration: BoxDecoration(
            //               border: Border.all(color: Colors.white, width: 2),
            //               color: Colors.black),
            //           alignment: Alignment.center,
            //           width: double.infinity,
            //           padding: EdgeInsets.all(5),
            //           child: Text(
            //             "لقد اخترت يوم لايوجد فيه هذه العيادة",
            //             style: TextStyle(
            //                 color: Colors.white, fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //   behavior: SnackBarBehavior.floating,
            //   // margin: EdgeInsets.only(bottom: ScreenHight / 2 - 50),
            // ));
          },
        ),
      );
    }
    return Column(children: textWidgetList);
  }

  Column appointmentTimeMethod(AsyncSnapshot<dynamic> snapshot, int index,
      DateTime date, mydate, context) {
    List mylist = snapshot.data;
    List<Widget> textWidgetList = [];

    List mylist2 = mylist.where((element) {
      return element['id_date'] == index + 1;
    }).toList();
    print(mylist);
    for (int i = 0; i < mylist2.length; i++) {
      textWidgetList.add(
        InkWell(
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.all(5),
            child: Text(
              "${mylist2[i]['reservation_time']} من ${mylist2[i]['reservation_Clinic_start_time']} ${mylist2[i]['reservation_Clinic_start_period']} حتى ${mylist2[i]['reservation_Clinic_end_time']} ${mylist2[i]['reservation_Clinic_end_period']}",
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () async {
            // print(mylist2[i]['date_day_number']);
            // List<int> the_prohibited_days2 = [];
            // for (int index2 = 1; index2 < 8; index2++) {
            //   if (index2 != mylist2[i]['date_day_number']) {
            //     // || index2 != 5
            //     the_prohibited_days2.add(index2);
            //   }
            // }
            // print(mylist2[i]['date_day_in_english']);
            // List<String> the_prohibited_days = [];
            // for (int i = 0; i < mylist2.length; i++) {
            //   if (mylist2[i]['date_day_in_english'] != "") {
            //     the_prohibited_days.add(mylist2[i]['date_day_in_english']);
            //   }
            // }
            // print(the_prohibited_days);

            // var ScreenHight = MediaQuery.of(context).size.height;
          },
        ),
      );
    }
    return Column(children: textWidgetList);
  }
}

//  child: Text(mylist2[index + 1]['date'])),

// السبت Saturday.
// الأحد Sunday.
// الإثنين Monday.
// الثلاثاء Tuesday.
// الأربعاء Wednesday.
// الخميس Thursday.
// الجمعة Friday.

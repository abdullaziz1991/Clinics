import 'dart:async';
import 'dart:io';

import 'package:clinics/Screens/Home.dart';
import 'package:clinics/Screens/tools/myAppBar.dart';

import 'package:clinics/models/clinics.dart';
import 'package:clinics/provider/allClinicsProvider.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';

late File file;

class surgery extends StatefulWidget {
  static const screenRoute = '/Surgery';

  const surgery({super.key});
  @override
  State<surgery> createState() => _surgeryState();
}

class _surgeryState extends State<surgery> {
  List<String> surgerys = [
    "Kidney Surgery".tr(),
    "heart Surgery".tr(),
    "Ear surgery".tr(),
    "Eyes Surgery".tr(),
    "Sinus surgery".tr(),
    "Urinary Surgery".tr(),
    "plastic surgery".tr(),
    "Thoracic Surgery".tr(),
    "Joint change Surgery".tr(),
    "Spinal surgery".tr(),
    "Surgery in the brain department".tr(),
  ];

  List<String> Clinics_Name = [];

  final TextEditingController _controller = TextEditingController();
  var operation_type = "Kidney Surgery".tr();
  String The_party_implementing_the_operation =
      "Alehsan Association Clinics".tr();
  String Medical_examination_result = "";
  // String A_copy_of_the_medical_report = "";
  //String Surgery_Cost = "";
  int The_Cost = 170000;

  savePref(
      String Operation_type,
      String The_party_implementing_the_operation,
      Medical_examination_result,
      A_copy_of_the_medical_report,
      Surgery_Cost) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Operation_type", Operation_type);
    preferences.setString("The_party_implementing_the_operation",
        The_party_implementing_the_operation);
    preferences.setString(
        "Medical_examination_result", Medical_examination_result);
    preferences.setString(
        "A_copy_of_the_medical_report", A_copy_of_the_medical_report);
    preferences.setString("Surgery_Cost", Surgery_Cost);

    print(preferences.getString("Operation_type"));
    print(preferences.getString("The_party_implementing_the_operation"));
    print(preferences.getString("Medical_examination_result"));
    print(preferences.getString("A_copy_of_the_medical_report"));
    print(preferences.getString("Surgery_Cost"));
  }

  XFile? A_copy_of_the_medical_report, Surgery_Cost;

  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media, int imageNumber) async {
    XFile? img = await picker.pickImage(source: media);

    setState(() {
      if (imageNumber == 1) {
        A_copy_of_the_medical_report = img;
      }
      if (imageNumber == 2) {
        Surgery_Cost = img;
      }
    });
  }

  late StreamSubscription subscription;
  @override
  void initState() {
    // subscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) {
    //   // Got a new connectivity status!
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isLanguageArabic = context.locale.languageCode == "ar";
    List<all_clinic_name> all_clinic_names2 = [];
    List<String> allclinics = [];
    List<String> allclinics_in_English = [];
    all_clinic_names2 = Provider.of<allClinicsProvider>(context, listen: false)
        .getall_clinic_names;

    for (int i = 0; i < all_clinic_names2.length; i++) {
      if (all_clinic_names2[i].clinics_type == "1") {
        allclinics.add(all_clinic_names2[i].clinic_name);
        allclinics_in_English.add(all_clinic_names2[i].clinic_name_in_english);
      }
    }
    // List<String> allclinics_in_English =
    //     Provider.of<allClinicsProvider>(context, listen: false)
    //         .allclinics_in_English;
    //print(allclinics);
    List<String> list = context.locale.languageCode == "ar"
        ? allclinics
        : allclinics_in_English;
    print("list +++++++++++++++++++++");
    print(list);

    var widthImage = MediaQuery.of(context).size.width;
    void myAlert(int imageNumber) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Text("Choose an image".tr(),
                  style: TextStyle(), textAlign: TextAlign.center),
              content: Container(
                height: MediaQuery.of(context).size.height / 6,
                child: Column(
                  children: [
                    ElevatedButton(
                      //if user click this button, user can upload image from gallery
                      onPressed: () {
                        Navigator.pop(context);
                        getImage(ImageSource.gallery, imageNumber);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.image),
                          SizedBox(
                            width: 10,
                          ),
                          Text("From the gallery".tr()),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      //if user click this button. user can upload image from camera
                      onPressed: () {
                        Navigator.pop(context);
                        getImage(ImageSource.camera, imageNumber);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.camera),
                          SizedBox(
                            width: 10,
                          ),
                          Text("From the camera".tr()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    Future<bool> _onWillPop() async {
      Navigator.of(context).pushNamed(Home.screenRoute);
      return (true);
    }

    return Scaffold(
        appBar: myappBar(
            "Process information".tr(), 45, isLanguageArabic, isDark, context),
        body: WillPopScope(
          onWillPop: _onWillPop,
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber),
                      child: Text("Operation type".tr(),
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: DropdownButton<String>(
                      value: operation_type,
                      hint: Container(
                        alignment: Alignment.center,
                        width: 180,
                        // child: Text(
                        //   "Hint text",
                        // ),
                      ), // textAlign: TextAlign.end
                      onChanged: (Object? value) {
                        setState(() {
                          //  savePref(value.toString());
                          //getSavedPref();
                          operation_type = value.toString();
                          //  surgert_cost(operation_type);
                          // The_Cost = 0;
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return surgerys.map<Widget>((String item) {
                          return Container(
                              alignment: Alignment.center,
                              width: 180,
                              child: Text(item, textAlign: TextAlign.start));
                        }).toList();
                      },
                      items: surgerys.map((String item) {
                        return DropdownMenuItem<String>(
                          child: Text(item),
                          value: item,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber),
                        child: Text(
                          "Determine the party that will conduct the Surgery"
                              .tr(),
                          style: TextStyle(
                              fontSize: context.locale.languageCode == "ar"
                                  ? 17
                                  : 15),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  Expanded(
                    flex: 3,
                    child: DropdownButton<String>(
                      // key: UniqueKey(),
                      value: The_party_implementing_the_operation,
                      onChanged: (Object? value) {
                        setState(() {
                          The_party_implementing_the_operation =
                              value.toString();
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return list.map<Widget>((String item) {
                          return Container(
                              alignment: Alignment.center,
                              width: 180,
                              child: Text(item, textAlign: TextAlign.end));
                        }).toList();
                      },
                      items: list.map((String item) {
                        return DropdownMenuItem<String>(
                          //   alignment: Alignment.topRight,
                          child: Text(item),
                          value: item,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  padding: EdgeInsets.all(8),
                  child: Text("Medical examination result".tr(),
                      style: TextStyle(
                        fontSize: 20,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.start),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(6),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  // textDirection: TextDirection.rtl,
                  controller: _controller,
                  cursorColor: Colors.black,
                  style: TextStyle(),
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.note,
                      color: Colors.black,
                    ),
                    filled: true, // بصير لون حقل البحث رمادي
                    //fillColor: Colors.black,// لون الحقل
                    hintText:
                        "Enter the result of the medical examination approved by the specialist doctor"
                            .tr(),
                    helperStyle: TextStyle(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.black, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.black, width: 2)),
                  ),
                  onChanged: (value) {
                    Medical_examination_result = value;
                  },
                  // onEditingComplete: () {  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "medical report :".tr(),
                          style: TextStyle(
                            fontSize:
                                context.locale.languageCode == "ar" ? 20 : 18,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //     // primary:
                      //     //     Color.fromARGB(255, 219, 10, 10) // Colors.amber,
                      //     ),
                      // style: ElevatedButton.styleFrom(
                      //     primary: Color.fromARGB(255, 175, 10, 190) // Colors.amber,
                      //     ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            "Choose an image".tr(),
                            style: TextStyle(
                                fontSize: context.locale.languageCode == "ar"
                                    ? 18
                                    : 16,
                                color: isDark ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                      onPressed: () {
                        myAlert(1);
                        // addProduct(A_copy_of_the_medical_report);
                        //showDialogMethod(context, 1);
                      },
                    ),
                  ],
                ),
              ),
              A_copy_of_the_medical_report != null
                  ? Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 218, 219, 226),
                          border: Border.all(color: Colors.black, width: 2)),
                      width: double.infinity,
                      height: widthImage / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.file(
                          //to show image, you type like this.
                          File(A_copy_of_the_medical_report!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 218, 219, 226),
                          border: Border.all(color: Colors.black, width: 2)),
                      width: double.infinity,
                      height: widthImage / 4,
                    ),
              Row(
                //  textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text("Surgery Cost".tr(),
                          style: TextStyle(
                            fontSize: 17,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      alignment: Alignment.center,
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 1),
                          color: Color.fromARGB(255, 243, 240, 240)),
                      child: Text("$The_Cost",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  // showDialogMethod(context, 2);
                  myAlert(2);
                },
                child: Row(
                  //textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 1,
                              color: isDark ? Colors.white : Colors.black,
                            )),
                        child: Text(
                            "A receipt for payment of the Surgery cost".tr(),
                            style: TextStyle(
                              fontSize:
                                  context.locale.languageCode == "ar" ? 17 : 15,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        alignment: Alignment.center,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black, width: 1),
                            color: Color.fromARGB(255, 243, 240, 240)),
                        child: Row(
                          //   textDirection: TextDirection.rtl,
                          children: [
                            Icon(
                              Icons.note,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Download the receipt here".tr(),
                                style: TextStyle(
                                    fontSize:
                                        context.locale.languageCode == "ar"
                                            ? 15
                                            : 14,
                                    color: Colors.black54),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Surgery_Cost != null
                  ? Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 218, 219, 226),
                          border: Border.all(color: Colors.black, width: 2)),
                      width: double.infinity,
                      height: widthImage / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.file(
                          //to show image, you type like this.
                          File(Surgery_Cost!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 218, 219, 226),
                          border: Border.all(color: Colors.black, width: 2)),
                      width: double.infinity,
                      height: widthImage / 4,
                    ),
              SizedBox(height: 5),
              InkWell(
                onTap: () {
                  if (Medical_examination_result == "" ||
                      A_copy_of_the_medical_report == "" ||
                      Surgery_Cost == "") {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Center(
                          child: Text(
                        "You forgot to fill in one of the fields",
                        style: TextStyle(color: Colors.amber),
                      )),
                    ));
                  } else {
                    savePref(
                        operation_type,
                        The_party_implementing_the_operation,
                        Medical_examination_result,
                        A_copy_of_the_medical_report,
                        Surgery_Cost);
                    String v =
                        "The request has been sent. You will be notified of the result of the request analysis soon"
                            .tr();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Center(
                          child: Text(
                              "The request has been sent. You will be notified of the result of the request analysis soon")),
                    ));
                  }

                  //  print(operation_type);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 219, 10, 10)),
                    child: Text(
                      "Send the order".tr(),
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontFamily: 'VariableFont_wght',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              // InkWell(
              //   child: Container(
              //     alignment: Alignment.center,
              //     width: double.infinity,
              //     child: Container(
              //       margin: EdgeInsets.symmetric(horizontal: 6),
              //       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: Color.fromARGB(255, 219, 10, 10)),
              //       child: Text("Send the order".tr(),
              //           style: TextStyle(fontSize: 17, color: Colors.white),
              //           textAlign: TextAlign.center),
              //     ),
              //   ),
              //   onTap: () async {
              //     Future<void> uploadimage(BuildContext context) async {
              //       File image;
              //       var picked = await ImagePicker();
              //       var pickedImage =
              //           await picked.pickImage(source: ImageSource.gallery);
              //       image = File(pickedImage!.path);
              //       //imageAsset هي متل  Image.file(_image) حتى اظهر الصورة بكتب ودجت
              //       // var picked = await ImagePicker()
              //       //     .pickImage(source: ImageSource.gallery);
              //       // // لما يضغط عزر اضافة صورة عن طرق المعرض
              //       // print("picked +++++++++++++++++++++++++++++++++++");
              //       // // print(picked);
              //       // if (picked != null) {
              //       //   file = File(picked.path);
              //       //   // شي اجيب رابط الصورة
              //       //   var rand = Random().nextInt(100000);
              //       //   var imagename = "$rand" + basename(picked.path);
              //       //   print(imagename);
              //       //   addProduct(file);
              //       // }
              //       var postUri = Uri.parse(
              //           "http://192.168.1.104/abdulaziz/addImage.php");

              //       http.MultipartRequest request =
              //           http.MultipartRequest("POST", postUri);

              //       http.MultipartFile multipartFile =
              //           await http.MultipartFile.fromPath("image", image!.path);

              //       request.files.add(multipartFile);

              //       http.StreamedResponse response = await request.send();

              //       print(response.statusCode);
              //     }

              //     await uploadimage(context);
              //   },
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     // final connectivityResult =
              //     //     await (Connectivity().checkConnectivity());
              //     // print(connectivityResult);
              //     // _showConnectivitySnackBar(connectivityResult, context);
              //   },
              //   child: Text("data"),
              // ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        )
        //: Center(child: CircularProgressIndicator()),
        );
  }
}

// void _showConnectivitySnackBar(
//     ConnectivityResult result, BuildContext context) {
//   final hasInternet = result != ConnectivityResult.none;
//   final message = hasInternet
//       ? result == ConnectivityResult.wifi
//           ? "You are connected via WiFi"
//           : "You are connected via mobile"
//       : "you have no internet";
//   final color = hasInternet ? Colors.green : Colors.red;
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     content: Center(child: Text(message)),
//   ));
// }

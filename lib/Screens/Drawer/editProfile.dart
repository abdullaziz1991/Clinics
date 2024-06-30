import 'dart:convert';
import 'dart:io';

import 'package:clinics/Screens/Home.dart';
import 'package:clinics/Screens/tools/myAppBar.dart';
import 'package:clinics/Screens/UserProfile.dart';
import 'package:clinics/models/clinics.dart';
import 'package:clinics/provider/ValuesProvider.dart';
import 'package:clinics/provider/clinicProvider.dart';
import 'package:clinics/provider/profileProvider.dart';
import 'package:clinics/provider/updateProfileProvider.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  static const screenRoute = '/EditProfile';
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController clinicName = TextEditingController();
  // TextEditingController xxx = TextEditingController();
  TextEditingController clinicName_in_english = TextEditingController();
  // TextEditingController clinicEmail = TextEditingController();
  TextEditingController clinicPlace = TextEditingController();
  TextEditingController clinicPlace_in_english = TextEditingController();
  Future<bool> _onWillPop() async {
    Navigator.of(context).pushReplacementNamed(Home.screenRoute);
    return (true);
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isLanguageArabic = context.locale.languageCode == "ar";
    clinics clinicDetails = Provider.of<ProfileProvider>(context).clinicDetails;
    // List<allClinics> allclinics =
    //     Provider.of<clinicProvider>(context, listen: false).allclinics;
    // clinicName = clinicDetails.clinic_name.toString() as TextEditingController;
    // clinicEmail =
    //     clinicDetails.clinic_email.toString() as TextEditingController;
    // clinicPlace =
    //     clinicDetails.clinics_place.toString() as TextEditingController;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // WillPopScope(
    //   onWillPop: _onWillPop,
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
            // extendBodyBehindAppBar: true,
            appBar: myappBar(
                "User information".tr(), 1, isLanguageArabic, isDark, context),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                      height: height,
                      width: width,
                      child: Stack(
                        children: [
                          CirclesMethod(-170, -150, Colors.orange, 1),
                          CirclesMethod(
                              -15, -205, Colors.white.withOpacity(0.5), 3),
                          CirclesMethod(
                              -10, -200, Colors.grey.withOpacity(0.2), 2),
                          CirclesMethod(
                              width - 150, height - 350, Colors.orange, 2),
                          CirclesMethod(width - 311, height - 455,
                              Colors.white.withOpacity(0.5), 3),
                          CirclesMethod(width - 306, height - 450,
                              Colors.grey.withOpacity(0.2), 2),
                        ],
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 580,
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          //alignment: Alignment.topRight,
                          height: 390,
                          width: width * 8.5 / 10,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 5), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: clinicName,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.orange,
                                  ),
                                  //labelText: "Write Your Email",
                                  hintText: context.locale.languageCode == "ar"
                                      ? clinicDetails.clinic_name
                                      : clinicDetails.clinic_name_in_english,
                                  hintStyle: TextStyle(color: Colors.black),
                                  //  labelStyle: TextStyle(color: Colors.green),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(
                                        width: 1,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 12, 2, 161),
                                        width: 1),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: clinicName_in_english,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.orange,
                                  ),
                                  //labelText: "Write Your Email",
                                  hintText: context.locale.languageCode == "ar"
                                      ? clinicDetails.clinic_name_in_english
                                      : clinicDetails.clinic_name,
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 12, 2, 161),
                                        width: 1),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: clinicPlace,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.room,
                                    color: Colors.orange,
                                  ),
                                  hintText: context.locale.languageCode == "ar"
                                      ? clinicDetails.clinics_place
                                      : clinicDetails.clinics_place_in_english,
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 12, 2, 161),
                                        width: 1),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: clinicPlace_in_english,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.room,
                                    color: Colors.orange,
                                  ),
                                  hintText: context.locale.languageCode == "ar"
                                      ? clinicDetails.clinics_place_in_english
                                      : clinicDetails.clinics_place,
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 12, 2, 161),
                                        width: 1),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              InkWell(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 6),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 219, 10, 10)),
                                  child: Text("Update information".tr(),
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                      textAlign: TextAlign.center),
                                ),
                                onTap: () {
                                  Provider.of<UpdateProfileProvider>(context,
                                          listen: false)
                                      .updateData(
                                          clinicDetails.id_names.toString(),
                                          clinicName.text.toString(),
                                          clinicName_in_english.text.toString(),
                                          clinicPlace.text.toString(),
                                          clinicPlace_in_english.text
                                              .toString());

                                  // print(clinicName.text);
                                  // print(clinicEmail.text);
                                  // print(clinicPlace.text);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: height / 8 - width / 6.6,
                      left: width / 2 - width / 6.6,
                      child: Container(
                          height: width / 3.3,
                          width: width / 3.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ))),
                  Positioned(
                    top: height / 8 - width / 7,
                    left: width / 2 - width / 7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: InkWell(
                        child: Container(
                          child: Provider.of<ValuesProvider>(context,
                                          listen: false)
                                      .email ==
                                  ""
                              ? Image.asset(
                                  "assets/images/53.jpg",
                                  height: width / 3.5,
                                  width: width / 3.5,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  "http://192.168.1.104/abdulaziz/images/${clinicDetails.clinics_image}",
                                  height: width / 3.5,
                                  width: width / 3.5,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        onTap: () async {
                          Future<void> uploadimage(BuildContext context) async {
                            File image;
                            var picked = await ImagePicker();
                            var pickedImage = await picked.pickImage(
                                source: ImageSource.gallery);
                            image = File(pickedImage!.path);
                            var postUri = Uri.parse(
                                "http://192.168.1.104/abdulaziz/addImage.php");

                            http.MultipartRequest request =
                                http.MultipartRequest("POST", postUri);

                            http.MultipartFile multipartFile =
                                await http.MultipartFile.fromPath(
                                    "image", image!.path);

                            request.files.add(multipartFile);

                            http.StreamedResponse response =
                                await request.send();

                            print(response.statusCode);
                            // http.Response response2 = await http.post(postUri);
                            // var responseBody = await jsonDecode(response2.body);
                            // print(responseBody["Status"]);
                            print(image.path.toString());
                            var formData = FormData.fromMap({
                              'clinics_image': image.path.split('/').last,
                              'id_names': clinicDetails.id_names
                            });
                            var response2 = await Dio().post(
                                'http://192.168.1.104/abdulaziz/Update/UpdateUserImage.php',
                                data: formData);

                            if (response2.statusCode == 200) {
                              Map<String, dynamic> jsonMap =
                                  json.decode(response2.data);
                              print(jsonMap["Status"]);
                              //print("jsonMap= +++++++++++++++++++++++");
                              if (jsonMap["Status"] ==
                                  "The operation succeeded") {
                                // Navigator.pushAndRemoveUntil(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => EditProfile()),
                                //   (Route<dynamic> route) => false,
                                // );
                                setState(() {
                                  true;
                                });
                              }
                            }
                          }

                          await uploadimage(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

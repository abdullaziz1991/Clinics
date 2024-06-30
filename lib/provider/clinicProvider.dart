import 'dart:convert';

import 'package:clinics/models/clinics.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class clinicProvider with ChangeNotifier {
  List<allClinics> allclinics = [];
  List<allClinics> get getallclinics {
    return allclinics;
  }
//  allClinics(
//       relation_clinic_name: "",
//       relation_clinic_specialization: "",
//       day_of_clinic: "",
//       day_number: "",
//       Clinic_start_time: "",
//       Clinic_start_period: "",
//       Clinic_end_time: "",
//       Clinic_end_period: "");

  getClinicsData() async {
    allclinics.clear();
    //String url = 'http://192.168.176.76/abdulaziz/select/selectAllClinics.php';
    String url = 'http://192.168.1.104/abdulaziz/select/selectAllClinics.php';
    Uri urlParse = Uri.parse(url);
    http.Response response = await http.post(urlParse);
    var responseBody = await jsonDecode(response.body);
    //if (responseBody['Status'] == 'success') {
    // print(responseBody);
    for (var element in responseBody["Result"]) {
      allClinics item = allClinics(
        id: element["id"].toString(),
        relation_clinic_name: element["relation_clinic_name"].toString(),
        clinics_type: element["clinics_type"].toString(),
        relation_clinic_specialization:
            element["relation_clinic_specialization"].toString(),
        clinic_level: element["clinic_level"].toString(),
        day_number: element["day_number"].toString(),
        Clinic_start_time: element["Clinic_start_time"].toString(),
        Clinic_start_period: element["Clinic_start_period"].toString(),
        Clinic_end_time: element["Clinic_end_time"].toString(),
        Clinic_end_period: element["Clinic_end_period"].toString(),
        clinic_Name: element["clinic_name"].toString(),
        clinic_name_in_english: element["clinic_name_in_english"].toString(),
        specialization: element["specialization"].toString(),
        specialization_in_english:
            element["specialization_in_english"].toString(),
        clinics_reward: element["clinics_reward"].toString(),
        clinics_place: element["clinics_place"].toString(),
        clinics_place_in_english:
            element["clinics_place_in_english"].toString(),
        clinic_Image: element["clinics_image"].toString(),
        Clinic_Cost: element["Clinic_Cost"].toString(),
      );
      // print(element["id"].toString());
      // print("objec++++++++++++++++++++++t");
      allclinics.add(item);
    }
    notifyListeners();
  }
}

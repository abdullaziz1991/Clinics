import 'dart:convert';
import 'package:clinics/models/clinics.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class allClinicsProvider with ChangeNotifier {
  // List<String> allclinics = [];
  // List<String> allclinics_in_English = [];
  List<all_clinic_name> all_clinic_names = [];
  List<all_clinic_name> get getall_clinic_names {
    return all_clinic_names;
  }

  getData() async {
    all_clinic_names.clear();
    String url = 'http://192.168.1.104/abdulaziz/select/selectAll.php';
    // https://abdullaziz.wuaze.com/abdulaziz/index.php
    Uri urlParse = Uri.parse(url);
    http.Response response = await http.post(urlParse);
    var responseBody = await jsonDecode(response.body);
    for (var element in responseBody["Result"]) {
      all_clinic_name item = all_clinic_name(
        clinic_name: element["clinic_name"].toString(),
        clinic_name_in_english: element["clinic_name_in_english"].toString(),
        clinics_type: element["clinics_type"].toString(),
      );
      all_clinic_names.add(item);
      // print(element["clinic_name"].toString());
      // print(element["clinic_name_in_english"].toString());
      // allclinics.add(
      //   element["clinic_name"].toString(),
      // );
      // allclinics_in_English.add(
      //   element["clinic_name_in_english"].toString(),
      // );
    }
    // notifyListeners();
  }
}

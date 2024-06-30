import 'dart:convert';
import 'package:clinics/models/clinics.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Clinics_Reservations_Provider with ChangeNotifier {
  // List<String> allclinics = [];
  // List<String> allclinics_in_English = [];
  List<all_Reservations> all_reservations = [];
  List<all_Reservations> get getall_clinic_names {
    return all_reservations;
  }

  getData() async {
    all_reservations.clear();
    String url =
        'http://192.168.1.104/abdulaziz/select/selectReservation_InClinic.php';
    Uri urlParse = Uri.parse(url);
    http.Response response = await http.post(urlParse);
    var responseBody = await jsonDecode(response.body);
    for (var element in responseBody["Result"]) {
      all_Reservations item = all_Reservations(
        Id_Reservations: element["Id_Reservations"].toString(),
        Relation_Clinic_Name: element["Relation_Clinic_Name"].toString(),
        Reservations_Person_Name:
            element["Reservations_Person_Name"].toString(),
        Reservations_Person_Name_inEnglish:
            element["Reservations_Person_Name_inEnglish"].toString(),
        Relation_Clinic_Type: element["Relation_Clinic_Type"].toString(),
        Reservations_Timing_And_Date:
            element["Reservations_Timing_And_Date"].toString(),
      );
      all_reservations.add(item);
    }
    // notifyListeners();
  }
}

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class deleteProvider with ChangeNotifier {
  deleteData(String relation_clinic_name,
      String relation_clinic_specialization) async {
    String url = 'http://192.168.1.104/abdulaziz/Delete/deleteClinic.php';
    Uri urlParse = Uri.parse(url);
    Map<String, String> data = {
      'relation_clinic_name': relation_clinic_name,
      "relation_clinic_specialization": relation_clinic_specialization
    };
    http.Response response = await http.post(urlParse, body: data);
    //var responseBody = await jsonDecode(response.body);
    print("deleted");
    //print(responseBody["Result"]);
    // deleteData(String id) async {
    //   var formData = FormData.fromMap({'id': id});
    //   var response = await Dio().post(
    //       'http://192.168.1.104/abdulaziz/select/selectUser.php',
    //       data: formData);
    //   if (response.statusCode == 200) {
    //     Map<String, dynamic> jsonMap = json.decode(response.data);
    //     //print(jsonMap);
    //     // print(jsonMap["Result"][0]["user_email"]);
    //     //print(jsonMap["Status"]);
    //     if (jsonMap["Status"] == "User exists") {
    //       print("succssed");

    //       notifyListeners();
    //     } else {}
    //   } else {
    //     print('Operation not uploaded - server response: ${response.statusCode}');
    //   }
    // }
  }
}

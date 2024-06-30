import 'dart:convert';

import 'package:clinics/models/clinics.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

saveUserInformation(String email, String password) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString("email", email);
  preferences.setString("password", password);

  print(preferences.getString("keyy"));
}

getUserInformation() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var country = preferences.get("keyy");
  if (country != null) {
    print("sccsesful");
  }
}

class ProfileProvider with ChangeNotifier {
  clinics clinicDetails = clinics(
      id_names: "",
      clinic_name: "",
      clinic_name_in_english: "",
      clinic_email: "",
      clinics_image: "",
      clinics_place: "",
      clinics_place_in_english: "",
      clinics_reward: "",
      clinics_type: "");

  getProductsFN(String email, String password) async {
    // print(" from provider===========================================");
    // print(email);
    // print(password);

    var formData = FormData.fromMap({
      'clinic_email': email.toString(),
      'clinic_password': password.toString(),
    });
    var response =
        await Dio().post('http://192.168.1.104/abdulaziz/select/selectUser.php',
            // 'http://192.168.176.76/abdulaziz/select/selectUser.php',
            data: formData);
    //print(response.data);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.data);
      //print(jsonMap);
      // print(jsonMap["Result"][0]["user_email"]);
      //print(jsonMap["Status"]);
      if (jsonMap["Status"] == "User exists") {
        // print(jsonMap["Result"][0]["clinic_email"]);
        // print(jsonMap["Result"][0]["id_names"]);
        // for (int index = 0; index < responseBody['data'].length; index++) {
        // id: responseBody['data'][index]['p_id'],

        //clinicDetails.add(clinicss);

        //print(clinicDetails.clinic_email);
        //   newValue() {
        // print(jsonMap["Result"][0]["clinic_email"]);
        clinicDetails = clinics(
          id_names: jsonMap["Result"][0]["id_names"].toString(),
          clinic_name: jsonMap["Result"][0]["clinic_name"],
          clinic_name_in_english: jsonMap["Result"][0]
              ["clinic_name_in_english"],
          clinic_email: jsonMap["Result"][0]["clinic_email"],
          clinics_image: jsonMap["Result"][0]["clinics_image"],
          clinics_place: jsonMap["Result"][0]["clinics_place"],
          clinics_place_in_english: jsonMap["Result"][0]
              ["clinics_place_in_english"],
          clinics_reward: jsonMap["Result"][0]["clinics_reward"].toString(),
          clinics_type: jsonMap["Result"][0]["clinics_type"].toString(),
        );
        notifyListeners();
        saveUserInformation(
            jsonMap["Result"][0]["clinic_email"], password.toString());
        // }
      } else {
        //print(jsonMap["Status"]);
      }
    } else {
      print('Operation not uploaded - server response: ${response.statusCode}');
    }

    // String url = 'http://192.168.54.119/shoppingTest/general/selectProduct.php';
    // Uri urlParse = Uri.parse(url);
    // http.Response response = await http.post(urlParse);
    // var responseBody = await jsonDecode(response.body);
  }
}

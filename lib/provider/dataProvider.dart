import 'dart:convert';
import 'package:clinics/models/clinics.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class dataProvider with ChangeNotifier {
  // List<id_And_Specialization> Specialization = [];
  // List<id_And_Specialization> get getSpecialization {
  //   return Specialization;
  // }

  List<String> all_ids = [];
  List<String> get get_all_ids {
    return all_ids;
  }

  List<String> all_Specializations = [];
  List<String> get get_all_Specializations {
    return all_Specializations;
  }

  List<String> all_Specializations_in_english = [];
  List<String> get get_all_Specializations_in_english {
    return all_Specializations_in_english;
  }

  getData() async {
    all_ids.clear();
    all_Specializations.clear();
    get_all_Specializations_in_english.clear();

    String url =
        'http://192.168.1.104/abdulaziz/select/selectSpecialization.php';
    // 'http://192.168.176.76/abdulaziz/select/selectSpecialization.php';

    Uri urlParse = Uri.parse(url);
    http.Response response = await http.post(urlParse);
    var responseBody = await jsonDecode(response.body);
    //  print(responseBody);
    if (responseBody["Status"] == "The operation succeeded") {
      for (var element in responseBody['Result']) {
        id_And_Specialization item = id_And_Specialization(
          id: element["id_specialization"].toString(),
          specialization: element["specialization"],
          specialization_in_english: element["specialization_in_english"],
        );
        //    Specialization.add(item);
        //  print(element["specialization_in_english"]);
        all_ids.add(item.id);
        all_Specializations.add(item.specialization);
        all_Specializations_in_english.add(item.specialization_in_english);
      }
    }
  }
}
  //   var response = await Dio()
  //       .post('http://192.168.1.104/abdulaziz/select/selectSpecialization.php');
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> jsonMap = json.decode(response.data);
  //     print(jsonMap);
  //     print(jsonMap["Status"]);
  //     if (jsonMap["Status"] == "The operation succeeded") {
  //       for (var element in jsonMap["Result"][0]) {
  //         id_And_Specialization item = id_And_Specialization(
  //           id: jsonMap["Result"][0]["id_specialization"].toString(),
  //           specialization: jsonMap["Result"][0]["specialization"].toString(),
  //         );
  //         Specialization.add(item);
  //         all_ids.add(item.id);
  //         all_Specializations.add(item.specialization);
  //       }
  //       notifyListeners();
  //     } else {
  //       //print(jsonMap["Status"]);
  //     }
  //   } else {
  //     print('Operation not uploaded - server response: ${response.statusCode}');
  //   }
  // }

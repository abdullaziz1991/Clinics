import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UpdateProfileProvider with ChangeNotifier {
  // List<all_clinic_name> all_clinic_names = [];
  // List<all_clinic_name> get getall_clinic_names {
  //   return all_clinic_names;
  // }

  updateData(String id_names, String clinic_name, String clinic_name_in_english,
      String clinics_place, String clinics_place_in_english) async {
    print(id_names);
    print(clinic_name);
    print(clinic_name_in_english);
    print(clinics_place);
    print(clinics_place_in_english);

    var formData = FormData.fromMap({
      'id_names': id_names.toString(),
      'clinic_name': clinic_name.toString(),
      'clinic_name_in_english': clinic_name_in_english.toString(),
      'clinics_place': clinics_place.toString(),
      'clinics_place_in_english': clinics_place_in_english.toString(),
    });
    var response = await Dio()
        .post('http://192.168.1.104/abdulaziz/Update/UpdateInformation.php',
            //'http://192.168.176.76/abdulaziz/insert/insertLast2.php',
            data: formData);
    if (response.statusCode == 200) {
      print("Information Uploaded");
      print('Operation uploaded - server response: ${response.statusCode}');
      // print(response);
    } else {
      print('Operation not uploaded - server response: ${response.statusCode}');
    }
  }
}

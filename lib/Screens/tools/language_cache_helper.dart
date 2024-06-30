import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(
    String Operation_type,
    // String The_party_implementing_the_operation,
    // String Medical_examination_result,
    // String A_copy_of_the_medical_report,
    // String Surgery_Cost,
    // String The_Cost,
  ) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Operation_type", Operation_type);
    // sharedPreferences.setString("The_party_implementing_the_operation",
    //     The_party_implementing_the_operation);
    // sharedPreferences.setString(
    //     "Medical_examination_result", Medical_examination_result);
    // sharedPreferences.setString(
    //     "A_copy_of_the_medical_report", A_copy_of_the_medical_report);
    // sharedPreferences.setString("Surgery_Cost", Surgery_Cost);
    // sharedPreferences.setString(
    //   "The_Cost",
    //   The_Cost as String,
    // );
  }

  Future<String> getCachedLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final String? Operation_type =
        sharedPreferences.getString("Operation_type");
    // final The_party_implementing_the_operation =
    //     sharedPreferences.getString("The_party_implementing_the_operation");
    // final Medical_examination_result =
    //     sharedPreferences.getString("Medical_examination_result");
    // final A_copy_of_the_medical_report =
    //     sharedPreferences.getString("A_copy_of_the_medical_report");
    // final Surgery_Cost = sharedPreferences.getString("Surgery_Cost");
    // final The_Cost = sharedPreferences.getString("The_Cost");

    if (Operation_type != null) {
      //&& The_party_implementing_the_operation != null && Medical_examination_result != null && A_copy_of_the_medical_report != null && Surgery_Cost != null && The_Cost != null
      return Operation_type;
    } else {
      return "عملية تجميلية";
    }
  }
}

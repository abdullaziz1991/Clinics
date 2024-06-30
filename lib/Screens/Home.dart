import 'package:clinics/Screens/Not_Logged_In.dart';
import 'package:clinics/Screens/Reservation.dart';
import 'package:clinics/Screens/base_page.dart';
import 'package:clinics/Screens/tools/myAppBar.dart';
import 'package:clinics/Screens/tools/myDrawer.dart';
import 'package:clinics/Screens/userProfile.dart';
import 'package:clinics/auth/login.dart';
import 'package:clinics/models/clinics.dart';
import 'package:clinics/provider/Clinics_Reservations.dart';
import 'package:clinics/provider/ValuesProvider.dart';
import 'package:clinics/provider/allClinicsProvider.dart';
import 'package:clinics/provider/clinicProvider.dart';
import 'package:clinics/provider/dataProvider.dart';
import 'package:clinics/provider/profileProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  static const screenRoute = '/Home';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static String? email = "", password = "";

  //int languageIndex = 0;
  bool isLogin = false;
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  getUserInformation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString("email");
    password = preferences.getString("password");
    if (email != null) {
      Provider.of<ProfileProvider>(context, listen: false)
          .getProductsFN(email.toString(), password.toString());
      Provider.of<ValuesProvider>(context, listen: false).saveEmail(email);
      // print(email);
      // print("33333333333 ++++++++++++++++++++");
    }
  }

  @override
  initState() {
    print(email);
    print("email ++++++++++++++++++++");
    getUserInformation();
    if (email != null) {
      Provider.of<dataProvider>(context, listen: false).getData();
      Provider.of<clinicProvider>(context, listen: false).getClinicsData();
      //Provider.of<allClinicsProvider>(context, listen: false).getData();
      // if (Provider.of<allClinicsProvider>(context, listen: false).allclinics ==
      //     []) {
      Provider.of<allClinicsProvider>(context, listen: false).getData();
      Provider.of<Clinics_Reservations_Provider>(context, listen: false)
          .getData();
    }

    // }

    //List<all_clinic_name> all_clinic_names2 = all_clinic_names;

    super.initState();
    //getData();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isLanguageArabic = context.locale.languageCode == "ar";

    // print(email);
    // print("email2222 ++++++++++++++++++++");
    // تخزين قيمة في بروفايدر
    // ValuesProvider get myEmail => Provider.of<ValuesProvider>(context, listen: false);
//final String variable1 = context.read<ClassProvider>().variable;
//final String variable2 = context.watch<ClassProvider>().variable;
    isLogin = email != "";
    String? myemail = Provider.of<ValuesProvider>(context, listen: false).email;
    //Provider.of<ValuesProvider>(context, listen: false).saveEmail(email)
    //isLogin = email != "";
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
    if (email != null) {
      clinicDetails = Provider.of<ProfileProvider>(context).clinicDetails;
    }
    // print(isLogin);
    // print("isLogin ++++++++++++++");
    List<Map<String, Object>> _screens = [
      {
        'Screen': base_page(),
        'Title': "Specialized clinics program".tr(),
      },
      {
        'Screen': email == "" ? Not_Logged_In() : Reservation(),
        //),
        'Title': "Reservations".tr(),
      },
      {
        'Screen': email == "" ? Login() : UserProfile(), //
        'Title': "Profile personally".tr(),
      },
    ];

    return Scaffold(
      drawer: MyDrawer(isDark, clinicDetails.clinics_image, context, myemail,
          clinicDetails.clinics_type),
      // Drawer(
      //     child: Column(
      //   children: [
      //     Container(
      //       height: 240,
      //       child: Column(
      //         children: [
      //           Container(
      //             height: 40,
      //             color: isDark ? Colors.black : Colors.white,
      //           ),
      //           myemail == ""
      //               ? Image.asset(
      //                   "assets/images/53.jpg",
      //                   fit: BoxFit.cover,
      //                   width: double.infinity,
      //                   height: 200,
      //                   //  width: double.infinity,
      //                 )
      //               : Image.network(
      //                   "http://192.168.1.104/abdulaziz/images/${clinicDetails.clinics_image}",
      //                   fit: BoxFit.cover,
      //                   width: double.infinity,
      //                   height: 200,
      //                 ),
      //         ],
      //       ),
      //     ),
      //     Divider(
      //       height: 2,
      //       thickness: 1,
      //       color: Colors.black,
      //     ),
      //     Container(
      //       height: 35,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           AnimatedIconButton(
      //             onPressed: () => print('all icons pressed'),
      //             icons: [
      //               AnimatedIconItem(
      //                 icon: Icon(
      //                   isDark ? Icons.light_mode : Icons.dark_mode,
      //                   color: isDark ? Colors.white : Colors.black,
      //                 ),
      //                 onPressed: () => ThemeManager.of(context)
      //                     .setBrightnessPreference(isDark
      //                         ? BrightnessPreference.light
      //                         : BrightnessPreference.dark),
      //               ),
      //               AnimatedIconItem(
      //                 icon: Icon(
      //                   isDark ? Icons.dark_mode : Icons.light_mode,
      //                   color: isDark ? Colors.black : Colors.white,
      //                 ),
      //                 onPressed: () => ThemeManager.of(context)
      //                     .setBrightnessPreference(isDark
      //                         ? BrightnessPreference.dark
      //                         : BrightnessPreference.light),
      //               ),
      //             ],
      //           ),
      //           IconButton(
      //               onPressed: () {
      //                 if (context.locale.languageCode == 'en') {
      //                   context.setLocale(Locale('ar'));
      //                 } else {
      //                   context.setLocale(Locale('en'));
      //                 }
      //               },
      //               icon: Icon(
      //                 Icons.language,
      //                 color: isDark ? Colors.white : Colors.black,
      //               )),
      //         ],
      //       ),
      //     ),
      //     Divider(
      //       thickness: 1,
      //       color: Colors.black,
      //     ),
      //     SingleChildScrollView(
      //       child: Column(children: [
      //         email != "" && clinicDetails.clinics_type == "1" ||
      //                 clinicDetails.clinics_type == "2" ||
      //                 clinicDetails.clinics_type == "3"
      //             ? Column(
      //                 children: [
      //                   drawerItem(Icons.add_circle, "Add a clinic".tr(),
      //                       context, insertClinic.screenRoute),
      //                   drawerItem(Icons.remove_circle, "Delete clinic".tr(),
      //                       context, deleteClinic.screenRoute),
      //                 ],
      //               )
      //             : SizedBox(),

      //         // drawerItem(Icons.bookmarks, "Added clinics".tr(), context,
      //         //     "find_friend"),
      //         email != ""
      //             ? drawerItem(Icons.manage_accounts, "Edit account".tr(),
      //                 context, EditProfile.screenRoute)
      //             : drawerItem(Icons.manage_accounts, "Edit account".tr(),
      //                 context, Login.screenRoute),
      //         drawerItem(Icons.logout, "sign out".tr(), context, ""),
      //       ]),
      //     )
      //   ],
      // )),

      appBar: myappBar(_screens[_selectedScreenIndex]['Title'] as String, 45,
          isLanguageArabic, isDark, context),
      body: _screens[_selectedScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.black,
        selectedItemColor: Color.fromARGB(255, 233, 162, 8),
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Clinics programme".tr(),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.offline_bolt),
          //   label: "الحجوزات",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cabin),
            label: "Reservations".tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: "Profile personally".tr(),
          ),
        ],
      ),
    );
  }
}

ListTile drawerItem(
  IconData iconItem,
  String title,
  BuildContext context,
  String root,
) {
  return ListTile(
    onTap: () {
      if (root != "") {
        Navigator.of(context).pushReplacementNamed("$root");
      } else {
        saveUserInformation("", "");
        Navigator.of(context).pushReplacementNamed(Home.screenRoute);
      }
    },
    leading: Icon(
      iconItem,
      size: 28,
      color: Colors.red,
    ),
    title: Text(
      "$title",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}

class AppColors {
  static var primary = Colors.blue;
}

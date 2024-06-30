import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:clinics/Screens/Home.dart';
import 'package:clinics/auth/login.dart';
import 'package:clinics/provider/profileProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:clinics/Screens/Drawer/deleteClinic.dart';
import 'package:clinics/Screens/Drawer/insert_clinic.dart';
import 'package:clinics/Screens/Drawer/editProfile.dart';

MyDrawer(bool isDark, String image, BuildContext context, String? myemail,
        String clinics_type) =>
    Drawer(
        child: Column(
      children: [
        Container(
          height: 240,
          child: Column(
            children: [
              Container(
                height: 40,
                color: isDark ? Colors.black : Colors.white,
              ),
              myemail == ""
                  ? Image.asset(
                      "assets/images/53.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                      //  width: double.infinity,
                    )
                  : Image.network(
                      "http://192.168.1.104/abdulaziz/images/${image}",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
            ],
          ),
        ),
        Divider(
          height: 2,
          thickness: 1,
          color: Colors.black,
        ),
        Container(
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedIconButton(
                onPressed: () => print('all icons pressed'),
                icons: [
                  AnimatedIconItem(
                    icon: Icon(
                      isDark ? Icons.light_mode : Icons.dark_mode,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    onPressed: () => ThemeManager.of(context)
                        .setBrightnessPreference(isDark
                            ? BrightnessPreference.light
                            : BrightnessPreference.dark),
                  ),
                  AnimatedIconItem(
                    icon: Icon(
                      isDark ? Icons.dark_mode : Icons.light_mode,
                      color: isDark ? Colors.black : Colors.white,
                    ),
                    onPressed: () => ThemeManager.of(context)
                        .setBrightnessPreference(isDark
                            ? BrightnessPreference.dark
                            : BrightnessPreference.light),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    if (context.locale.languageCode == 'en') {
                      context.setLocale(Locale('ar'));
                    } else {
                      context.setLocale(Locale('en'));
                    }
                  },
                  icon: Icon(
                    Icons.language,
                    color: isDark ? Colors.white : Colors.black,
                  )),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.black,
        ),
        SingleChildScrollView(
          child: Column(children: [
            myemail != "" && clinics_type == "1" ||
                    clinics_type == "2" ||
                    clinics_type == "3"
                ? Column(
                    children: [
                      drawerItem(Icons.add_circle, "Add a clinic".tr(), context,
                          insertClinic.screenRoute),
                      drawerItem(Icons.remove_circle, "Delete clinic".tr(),
                          context, deleteClinic.screenRoute),
                    ],
                  )
                : SizedBox(),

            // drawerItem(Icons.bookmarks, "Added clinics".tr(), context,
            //     "find_friend"),
            myemail != ""
                ? drawerItem(Icons.manage_accounts, "Edit account".tr(),
                    context, EditProfile.screenRoute)
                : drawerItem(Icons.manage_accounts, "Edit account".tr(),
                    context, Login.screenRoute),
            drawerItem(Icons.logout, "sign out".tr(), context, ""),
          ]),
        )
      ],
    ));

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

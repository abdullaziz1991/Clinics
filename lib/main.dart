import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:clinics/Screens/CT_Scan.dart';
import 'package:clinics/Screens/Drawer/deleteClinic.dart';
import 'package:clinics/Screens/Drawer/editProfile.dart';
import 'package:clinics/Screens/Drawer/insert_clinic.dart';
import 'package:clinics/Screens/Herbal_Treatment.dart';
import 'package:clinics/Screens/Not_Logged_In.dart';
import 'package:clinics/Screens/Reservation.dart';
import 'package:clinics/Screens/home.dart';
import 'package:clinics/Screens/psychological.dart';
import 'package:clinics/Screens/surgery.dart';
import 'package:clinics/Screens/userProfile.dart';
import 'package:clinics/auth/login.dart';
import 'package:clinics/auth/signup.dart';
import 'package:clinics/provider/Clinics_Reservations.dart';
import 'package:clinics/provider/ValuesProvider.dart';
import 'package:clinics/provider/allClinicsProvider.dart';
import 'package:clinics/provider/clinicProvider.dart';
import 'package:clinics/provider/dataProvider.dart';
import 'package:clinics/provider/deleteProvider.dart';
import 'package:clinics/provider/profileProvider.dart';
import 'package:clinics/provider/updateProfileProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await Future.delayed(Duration(seconds: 2));
  // FlutterNativeSplash.remove();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // systemNavigationBarColor: Color(0xFF000000),
    // systemNavigationBarIconBrightness: Brightness.light,
    // systemNavigationBarDividerColor: null,
    statusBarColor: Colors.transparent,
    // statusBarIconBrightness: Brightness.dark,
    // statusBarBrightness: Brightness.dark,
  ));
  // Needs to be called so that we can await for EasyLocalization.ensureInitialized();
// flutter pub run easy_localization:generate -S “assets/lang” -O “lib/lang”
// flutter pub run easy_localization:generate -S “assets/lang” -O “lib/lang” -o “locale_keys.g.dart” -f keys

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ChangeNotifierProvider(create: (context) => dataProvider()),
      ChangeNotifierProvider(create: (context) => clinicProvider()),
      ChangeNotifierProvider(create: (context) => allClinicsProvider()),
      ChangeNotifierProvider(create: (context) => deleteProvider()),
      ChangeNotifierProvider(create: (context) => UpdateProfileProvider()),
      ChangeNotifierProvider(create: (context) => ValuesProvider()),
      ChangeNotifierProvider(
          create: (context) => Clinics_Reservations_Provider()),
    ],
    child: EasyLocalization(
      // supportedLocales:  [
      //   Locale('en'),
      //   Locale('ar'),
      // ],
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      //startLocale: const Locale('ar'),
      saveLocale: true,

      // assetLoader: CodegenLoader(),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ThemeManager(
    //   defaultBrightnessPreference: BrightnessPreference.system,
    //   //خود الثيم من ثيم نظام التشغيل عندي
    //   loadBrightnessOnStart: true,
    //   data: (Brightness brightness) => ThemeData(
    //     primarySwatch: Colors.blue,
    //     hintColor: Colors.lightBlue,
    //     //accentColor: Colors.lightBlue,
    //     brightness: brightness,
    //     // appBarTheme: AppBarTheme(backgroundColor: Colors.black),
    //   ),

    //   themedWidgetBuilder: (BuildContext context, ThemeData theme) {
    //     return MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       localizationsDelegates: context.localizationDelegates,
    //       supportedLocales: context.supportedLocales,
    //       locale: context.locale,
    //       theme: theme,
    return ThemeManager(
      defaultBrightnessPreference: BrightnessPreference.system,
      data: (Brightness brightness) => ThemeData(
        primarySwatch: Colors.blue,
        //accentColor: Colors.lightBlue,
        brightness: brightness,

        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.cyan),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.black,
          // decorationColor: Colors.red,
          // displayColor: Colors.green,
        ),
      ),
      loadBrightnessOnStart: true,
      themedWidgetBuilder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          title: 'My Clinics',
          theme: theme,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: Home(),
          routes: {
            Home.screenRoute: (context) => Home(),
            Psychological.screenRoute: (context) => Psychological(),
            Herbal_Treatment.screenRoute: (context) => Herbal_Treatment(),
            surgery.screenRoute: (context) => surgery(),
            //Clinics_Details.screenRoute: (context) => Clinics_Details(),
            Reservation.screenRoute: (context) => Reservation(),
            Login.screenRoute: (context) => Login(),
            SignUp.screenRoute: (context) => SignUp(),
            insertClinic.screenRoute: (context) => insertClinic(),
            deleteClinic.screenRoute: (context) => deleteClinic(),
            EditProfile.screenRoute: (context) => EditProfile(),
            CT_Scan.screenRoute: (context) => CT_Scan(),

            "userprofile": (context) => UserProfile(),
            Not_Logged_In.screenRoute: (context) => Not_Logged_In(),
          },
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:theme_manager/change_theme_widget.dart';
// import 'package:theme_manager/theme_manager.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized(); // Required
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ThemeManager(
//       /// WidgetsBinding.instance.window.platformBrightness is used because a
//       /// Material BuildContext will not be available outside of the Material app
//       defaultBrightnessPreference: BrightnessPreference.light,
//       data: (Brightness brightness) => ThemeData(
//         primarySwatch: Colors.blue,
//         brightness: brightness,
//       ),
//       themeChangeListener: (ThemeState state) {
//         debugPrint('ThemeState: ${state.brightnessPreference}');
//         // Could post updates to a state manager here.
//       },
//       themedBuilder: (BuildContext context, ThemeState state) {
//         return MaterialApp(
//           title: 'Theme Manager Demo',
//           theme: state.themeData,
//           home: const MyHomePage(),
//         );
//       }, themedWidgetBuilder: (BuildContext context, ThemeData data) {  },
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final brightnessPreference =
//         ThemeManager.of(context).state.brightnessPreference;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Theme Manager'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: IntrinsicWidth(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor:
//                       brightnessPreference.isSystem ? Colors.red : Colors.blue,
//                 ),
//                 onPressed: () => ThemeManager.of(context)
//                     .setBrightness(BrightnessPreference.system),
//                 child: const Text('System'),
//               ),
//               const SizedBox(height: 12),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor:
//                       brightnessPreference.isSystem ? Colors.red : Colors.blue,
//                 ),
//                 onPressed: () => ThemeManager.of(context)
//                     .setBrightnessPreference(BrightnessPreference.light),
//                 child: const Text('Light'),
//               ),
//               const SizedBox(height: 12),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor:
//                       brightnessPreference.isSystem ? Colors.red : Colors.blue,
//                 ),
//                 onPressed: () => ThemeManager.of(context)
//                     .setBrightnessPreference(BrightnessPreference.dark),
//                 child: const Text('Dark'),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           ThemePickerDialog.show(context, (preference) {
//             ThemeManager.of(context).setBrightnessPreference(preference);
//           });
//         },
//         child: ThemeBuilder(
//           builder: (context, themeState) {
//             switch (themeState.brightnessPreference) {
//               case BrightnessPreference.light:
//                 return const Icon(Icons.wb_sunny);
//               case BrightnessPreference.dark:
//                 return const Icon(Icons.brightness_3);
//               default:
//                 return const Icon(Icons.brightness_auto);
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

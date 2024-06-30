import 'package:clinics/Screens/Home.dart';
import 'package:clinics/Screens/tools/myAppBar.dart';

import 'package:clinics/provider/dataProvider.dart';
import 'package:clinics/provider/profileProvider.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  static const screenRoute = '/SignUp';
  //SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _pageController = PageController(
    initialPage: 0,
    // viewportFraction: 0.8,
  );

  FocusNode confirmNode = FocusNode();
  bool loading = true;
  // TextEditingController Password = TextEditingController();
  // TextEditingController Email = TextEditingController();
  // TextEditingController Username = TextEditingController();
  // TextEditingController ClinicName = TextEditingController();
  // TextEditingController ClinicName_inEnglish = TextEditingController();
  // TextEditingController ClinicPlace = TextEditingController();
  // TextEditingController ClinicPlace_inEnglish = TextEditingController();

  int clinics_type = 0;
  String Password = "",
      Email = "",
      Username = "",
      ClinicName = "",
      ClinicName_inEnglish = "",
      ClinicPlace = "",
      ClinicPlace_inEnglish = "";
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  GlobalKey<FormState> formstate2 = new GlobalKey<FormState>();
  String UserType = "Clinic".tr();
  // CollectionReference myProfileInformation =
  //     FirebaseFirestore.instance.collection("myProfileInformation");
  showLoading(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Please Wait"),
            content: Container(
                height: 50, child: Center(child: CircularProgressIndicator())),
          );
        });
  }

  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      showLoading(context);
    } else {}
  }

  PageController? pageController = PageController(
    initialPage: 0,
  );

  int pageIndex = 0;
  GlobalKey<FormState> form1Key = GlobalKey<FormState>(debugLabel: 'form1');
  GlobalKey<FormState> form2Key = GlobalKey<FormState>(debugLabel: 'form2');
  GlobalKey<FormState> form3Key = GlobalKey<FormState>(debugLabel: 'form3');

  Future<bool> _onWillPop() async {
    Navigator.of(context).pop();
    return (true);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isLanguageArabic = context.locale.languageCode == "ar";
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: myappBar("Sign Up".tr(), 1, isLanguageArabic, isDark, context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/images/29.jpg")),
            Expanded(
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal, // or Axis.vertical
                pageSnapping: true,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                children: [
                  Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Form(
                                  key: formstate,
                                  child: Column(
                                    children: [
                                      TextFormFieldMethod(
                                          "Email",
                                          "Email can't to be larger than 100 letter",
                                          "Email can't to be less than 2 letter",
                                          Icons.email,
                                          "Email".tr(),
                                          isDark),
                                      SizedBox(height: 20),
                                      TextFormFieldMethod(
                                          "Password",
                                          "Password can't to be larger than 100 letter",
                                          "Password can't to be less than 4 letter",
                                          Icons.article,
                                          "Password".tr(),
                                          isDark),
                                      SizedBox(height: 20),
                                      UserTypeMethod(width),
                                      SizedBox(height: 10),
                                      GoToHomeMethod(context),
                                      SizedBox(height: 8),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      )),
                  Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Form(
                                  key: formstate2,
                                  child: Column(
                                    children: [
                                      TextFormFieldMethod(
                                          "ClinicName",
                                          "Email can't to be larger than 100 letter",
                                          "Email can't to be less than 2 letter",
                                          Icons.add_box,
                                          "ClinicName".tr(),
                                          isDark),
                                      SizedBox(height: 10),
                                      TextFormFieldMethod(
                                          "ClinicName_inEnglish",
                                          "Password can't to be larger than 100 letter",
                                          "Password can't to be less than 4 letter",
                                          Icons.add_box,
                                          "ClinicName_inEnglish".tr(),
                                          isDark),
                                      SizedBox(height: 10),
                                      TextFormFieldMethod(
                                          "ClinicPlace",
                                          "Password can't to be larger than 100 letter",
                                          "Password can't to be less than 4 letter",
                                          Icons.room,
                                          "ClinicPlace".tr(),
                                          isDark),
                                      SizedBox(height: 10),
                                      TextFormFieldMethod(
                                          "ClinicPlace_inEnglish",
                                          "Password can't to be larger than 100 letter",
                                          "Password can't to be less than 4 letter",
                                          Icons.room,
                                          "ClinicPlace_inEnglish".tr(),
                                          isDark),
                                      SizedBox(height: 7),
                                      GoToHomeMethod(context),
                                      SizedBox(height: 7),
                                      InkWell(
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 25),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.orange,
                                            ),
                                            child: Text(
                                              "Sign Up".tr(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  fontWeight: FontWeight.bold),
                                              // style: Theme.of(context).textTheme.headline6,
                                            )),
                                        onTap: () async {
                                          print("object ++++++++++");
                                          print(ClinicName);
                                          print(ClinicName_inEnglish);
                                          print(Email);
                                          print(ClinicPlace);
                                          print(ClinicPlace_inEnglish);
                                          // print(clinics_type);

                                          if (true) {
                                            var formData = FormData.fromMap({
                                              'clinic_name': ClinicName,
                                              'clinic_name_in_english':
                                                  ClinicName_inEnglish,
                                              'clinic_email': Email,
                                              //  'clinics_image': "",
                                              'clinics_place': ClinicPlace,
                                              'clinics_place_in_english':
                                                  ClinicPlace_inEnglish,
                                              'clinics_reward': 0,
                                              'clinics_type': clinics_type,
                                              'user_password': Password
                                            });
                                            var response = await Dio().post(
                                                'http://192.168.1.104/abdulaziz/insert/insertNewUser.php',
                                                //'http://192.168.176.76/abdulaziz/insert/insertLast2.php',
                                                data: formData);
                                            if (response.statusCode == 200) {
                                              print("Clinic Uploaded");
                                              print(
                                                  'Operation uploaded - server response: ${response.statusCode}');
                                              // print(response);
                                            } else {
                                              print(
                                                  'Operation not uploaded - server response: ${response.statusCode}');
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  "The clinic's end time should be after its start"
                                                      .tr()),
                                            ));
                                          }
                                          // Provider.of<ProfileProvider>(context,
                                          //         listen: false)
                                          //     .getProductsFN(Email.toString(),
                                          //         Password.toString());
                                          // Provider.of<dataProvider>(context,
                                          //         listen: false)
                                          //     .getData();
                                          // Navigator.of(context)
                                          //     .pushReplacementNamed(
                                          //         Home.screenRoute);
                                          // Navigator.of(context)
                                          //     .pushReplacementNamed(UserProfile.screenRoute);
                                        },
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageIndex == 0
                    ? const SizedBox(width: 25)
                    : GestureDetector(
                        onTap: () {
                          pageController!.animateToPage(pageIndex - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                // شي احط الدوارئر بنص
                const Spacer(),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      for (int i = 0; i < 2; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          child: CircleAvatar(
                            radius: pageIndex == i ? 4 : 3,
                            backgroundColor:
                                pageIndex == i ? Colors.blue : Colors.grey,
                          ),
                        ),
                    ],
                  ),
                ),
                // منشان الدوائر
                const Spacer(),
                pageIndex < 3
                    ? GestureDetector(
                        onTap: () {
                          if (pageIndex == 0) {
                            if (form1Key.currentState!.validate()) {
                              pageController!.animateToPage(pageIndex + 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                          } else if (pageIndex == 1) {
                            if (form2Key.currentState!.validate()) {
                              pageController!.animateToPage(pageIndex + 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                          }
                        },
                        child: const Icon(Icons.arrow_forward_ios))
                    : const SizedBox(
                        width: 25,
                      ),
                // منشان السهم الي لقدام
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Container GoToHomeMethod(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            //  Text("if you have an account ".tr()),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Home.screenRoute);
              },
              child: Text(
                "Go to Home Page".tr(),
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ));
  }

  Container UserTypeMethod(double width) {
    List<String> list = [
      "User".tr(),
      "Clinic".tr(),
      "Private Doctor".tr(),
      "CT Center".tr()
    ];
    return Container(
      width: width - 40,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Icon(
            Icons.add_box,
            color: Colors.orange,
          ),
          SizedBox(width: 10),
          DropdownButton<String>(
            value: UserType,
            onChanged: (Object? value) {
              setState(() {
                UserType = value.toString();
                clinics_type = list.indexOf(value.toString());
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return list.map<Widget>((String item) {
                return Container(
                    alignment: Alignment.center,
                    //  color: Colors.amber,
                    width: width - 126,
                    child: Text(item, textAlign: TextAlign.start));
              }).toList();
            },
            items: list.map((String item) {
              return DropdownMenuItem<String>(
                alignment: Alignment.center,
                child: Text(item),
                value: item,
              );
            }).toList(),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: Colors.black.withOpacity(0.4))
          // borderSide: BorderSide(width: 1),
          ),
    );
  }

  TextFormField TextFormFieldMethod(
      //TextEditingController value,
      String value,
      String validator1,
      String validator2,
      IconData icon,
      String label,
      bool isDark) {
    return TextFormField(
      //controller: value,
      style: TextStyle(color: isDark ? Colors.white : Colors.black),

      onChanged: (String val) {
        if (value == "Email") {
          Email = val;
        }
        if (value == "Password") {
          Password = val;
        }
        if (value == "ClinicName") {
          ClinicName = val;
        }
        if (value == "ClinicName_inEnglish") {
          ClinicName_inEnglish = val;
        }
        if (value == "ClinicPlace") {
          ClinicPlace = val;
        }
        if (value == "ClinicPlace_inEnglish") {
          ClinicPlace_inEnglish = val;
        }

        print(val);
        // منشان يحفظ المعلومات المدخلة
      },
      validator: (val) {
        if (val!.length > 100) {
          return validator1;
        }
        if (val.length < 2) {
          return validator2;
        }
        return null;
      },
      //  obscureText: true,

      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.orange,
            size: label == "ClinicPlace".tr() ||
                    label == "ClinicPlace_inEnglish".tr()
                ? 28
                : 24,
          ),
          // hintText: "Write Your Email".tr(),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1, color: Colors.black),
          )),
    );
  }
}

Padding dropDownMethod(
    double screenWidth, String initValue, List<String> list) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Row(
      children: [
        DropdownButton<String>(
          value: initValue,
          hint: Container(
            alignment: Alignment.centerRight,
            width: 180,
            // child: Text(
            //   "Hint text",
            // ),
          ), // textAlign: TextAlign.end

          // items: list.map((String value) {
          //   return new DropdownMenuItem<String>(
          //     value: value,
          //     child: new Text(value),
          //   );
          // }).toList(),
          onChanged: (Object? value) {},
          selectedItemBuilder: (BuildContext context) {
            return list.map<Widget>((String item) {
              return Container(
                  alignment: Alignment.center,
                  width: screenWidth / 2,
                  child: Text(item, textAlign: TextAlign.end));
            }).toList();
          },
          items: list.map((String item) {
            return DropdownMenuItem<String>(
              alignment: Alignment.topRight,
              child: Text(item),
              value: item,
            );
          }).toList(),
        ),
      ],
    ),
  );
}

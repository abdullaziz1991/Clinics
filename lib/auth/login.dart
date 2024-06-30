import 'package:clinics/Screens/Home.dart';
import 'package:clinics/auth/signup.dart';
import 'package:clinics/provider/dataProvider.dart';
import 'package:clinics/provider/profileProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const screenRoute = '/Login';
  //Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var mypassword, myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

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

  signIn() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      // try {
      //   showLoading(context);
      //   UserCredential userCredential = await FirebaseAuth.instance
      //       .signInWithEmailAndPassword(email: myemail, password: mypassword);
      //   return userCredential;
      // } on FirebaseAuthException catch (e) {
      //   if (e.code == 'user-not-found') {
      //     Navigator.of(context).pop();
      //     // showLoading(context) منشان اخلص من دائرة الانتظار والدائرة موجودة ب
      //     AwesomeDialog(
      //         context: context,
      //         title: "Error",
      //         body: Text("No user found for that email"))
      //       ..show();
      //   } else if (e.code == 'wrong-password') {
      //     Navigator.of(context).pop();
      //     AwesomeDialog(
      //         context: context,
      //         title: "Error",
      //         body: Text("Wrong password provided for that user"))
      //       ..show();
      //   }
      // }
    } else {
      print("Not Vaild");
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Future<bool> _onWillPop() async {
      Navigator.of(context).pop();
      return (true);
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/29.jpg")),
              Container(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: formstate,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(
                              color: isDark ? Colors.white : Colors.black),
                          onChanged: (String val) {
                            myemail = val;
                            print(myemail);
                            // منشان يحفظ المعلومات المدخلة
                          },
                          validator: (val) {
                            if (val!.length > 100) {
                              return "Email can't to be larger than 100 letter";
                            }
                            if (val.length < 2) {
                              return "Email can't to be less than 2 letter";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.orange,
                              ),
                              // hintText: "Write Your Email".tr(),
                              labelText: "Email".tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(width: 1),
                              )),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(
                              color: isDark ? Colors.white : Colors.black),
                          onChanged: (val) {
                            mypassword = val;
                            print(mypassword);
                          },
                          validator: (val) {
                            if (val!.length > 100) {
                              return "Password can't to be larger than 100 letter";
                            }
                            if (val.length < 4) {
                              return "Password can't to be less than 4 letter";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.article,
                                color: Colors.orange,
                              ),
                              // hintText: "Write Your Password".tr(),
                              labelText: "Password".tr(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(width: 1),
                              )),
                        ),
                        SizedBox(height: 10),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                  "if you don't have an account ".tr(),
                                  style: TextStyle(
                                      color:
                                          isDark ? Colors.white : Colors.black),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        SignUp.screenRoute);
                                  },
                                  child: Text(
                                    "Click Here".tr(),
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                )
                              ],
                            )),
                        SizedBox(height: 5),
                        InkWell(
                          child: Container(
                              //   width: width / 2,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.orange,
                              ),
                              child: Text(
                                "Sign in".tr(), textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white.withOpacity(0.8),
                                    fontWeight: FontWeight.bold),
                                // style: Theme.of(context).textTheme.headline6,
                              )),
                          onTap: () async {
                            await Provider.of<ProfileProvider>(context,
                                    listen: false)
                                .getProductsFN(
                                    myemail.toString(), mypassword.toString());
                            await Provider.of<dataProvider>(context,
                                    listen: false)
                                .getData();
                            Navigator.of(context)
                                .pushReplacementNamed(Home.screenRoute);
                            // Navigator.of(context)
                            //     .pushReplacementNamed(UserProfile.screenRoute);
                          },
                        ),

                        // Container(
                        //  child:
                        // ElevatedButton(
                        //   onPressed: () async {
                        //     var user = await signIn();
                        //     if (user != null) {
                        //       // Navigator.of(context)
                        //       //     .pushReplacementNamed("find friend");
                        //     }
                        //   },
                        //   child: Text(
                        //     "Sign in",
                        //     style: Theme.of(context).textTheme.headline6,
                        //   ),
                        // ),
                        // )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*

showLoading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Please Wait"),
          content: Container(
              height: 50,
              child: Center(
                child: CircularProgressIndicator(),
              )),
        );
      });
}


*/

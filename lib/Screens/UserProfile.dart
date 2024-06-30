import 'package:clinics/Screens/Drawer/editProfile.dart';
import 'package:clinics/Screens/Home.dart';

import 'package:clinics/models/clinics.dart';
import 'package:clinics/provider/ValuesProvider.dart';
import 'package:clinics/provider/clinicProvider.dart';
import 'package:clinics/provider/profileProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    clinics clinicDetails = Provider.of<ProfileProvider>(context).clinicDetails;
    List<allClinics> allclinics =
        Provider.of<clinicProvider>(context, listen: false).allclinics;
    bool isThereData = allclinics.isNotEmpty;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Future<bool> _onWillPop() async {
      Navigator.of(context).pushNamed(Home.screenRoute);
      return (true);
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          body: !isThereData
              ? Center(
                  child: Container(
                      height: 200,
                      width: 200,
                      child: Lottie.asset("assets/Animation/6.json",
                          fit: BoxFit.cover)))
              : SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                          height: height,
                          width: width,
                          child: Stack(
                            children: [
                              CirclesMethod(-170, -150, Colors.orange, 1),
                              CirclesMethod(
                                  -15, -205, Colors.white.withOpacity(0.5), 3),
                              CirclesMethod(
                                  -10, -200, Colors.grey.withOpacity(0.2), 2),
                              CirclesMethod(
                                  width - 150, height - 350, Colors.orange, 2),
                              CirclesMethod(width - 311, height - 455,
                                  Colors.white.withOpacity(0.5), 3),
                              CirclesMethod(width - 306, height - 450,
                                  Colors.grey.withOpacity(0.2), 2),
                            ],
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 4 * height / 10,
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              //alignment: Alignment.topRight,
                              height: height / 3.5,
                              width: width * 8.5 / 10,
                              padding: EdgeInsets.only(top: width / 6 + 10),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      context.locale.languageCode == "ar"
                                          ? clinicDetails.clinic_name
                                          : clinicDetails
                                              .clinic_name_in_english,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    clinicDetails.clinic_email,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            Color.fromRGBO(32, 16, 173, 0.867)),
                                  ),
                                  SizedBox(height: 10),
                                  Column(
                                    children: [
                                      clinicDetails.clinics_type != "0"
                                          ? Row(
                                              children: [
                                                SizedBox(width: 20),
                                                Text(
                                                  "the Cost".tr(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black),
                                                  // fontWeight: FontWeight.bold
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Text(
                                                    clinicDetails
                                                        .clinics_reward,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black87),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : SizedBox(),
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Text(
                                            "Location".tr(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                          Flexible(
                                            child: Text(
                                              context.locale.languageCode ==
                                                      "ar"
                                                  ? clinicDetails.clinics_place
                                                  : clinicDetails
                                                      .clinics_place_in_english,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black87),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          titleMethod("Existing clinics :".tr(), width,
                              clinicDetails.clinics_type == "1", isDark),
                          Container(
                            alignment: AlignmentDirectional.topStart,
                            child: Wrap(
                              children: [
                                SizedBox(width: width * 0.073),
                                clinicDetails.clinics_type == "1"
                                    ? clinicMethod(allclinics,
                                        clinicDetails.clinic_name, width)
                                    : Text(""),
                              ],
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        child: InkWell(
                          child: Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 231, 176, 10),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, EditProfile.screenRoute);
                          },
                        ),
                        top: 4 * height / 10 - height / 3.5 + 10,
                        left: 0.83 * width,
                      ),
                      Positioned(
                          top: height / 8 - width / 6.6,
                          left: width / 2 - width / 6.6,
                          child: Container(
                              height: width / 3.3,
                              width: width / 3.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                              ))),
                      Positioned(
                        top: height / 8 - width / 7,
                        left: width / 2 - width / 7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            child: Provider.of<ValuesProvider>(context,
                                            listen: false)
                                        .email ==
                                    ""
                                ? Image.asset(
                                    "assets/images/53.jpg",
                                    height: width / 3.5,
                                    width: width / 3.5,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    "http://192.168.1.104/abdulaziz/images/${clinicDetails.clinics_image}",
                                    height: width / 3.5,
                                    width: width / 3.5,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }

  Wrap clinicMethod(
      List<allClinics> allclinics, String clinic_name, double width) {
    bool isReapeted = false;
    List data1 = [], data = [], data_in_english1 = [], data_in_english = [];
    List<Widget> textWidgetList = [];
    for (int i = 0; i < allclinics.length; i++) {
      if (allclinics[i].clinic_Name == clinic_name) {
        data1.add(allclinics[i].specialization);
        data_in_english1.add(allclinics[i].specialization_in_english);
      }
    }
    //data.addAll(data1);
    // print(data1);
    // print("data1 +++++++++++++++");
    data.add(data1[0]);
    data_in_english.add(data_in_english1[0]);
    for (int j = 0; j < data1.length; j++) {
      for (int k = 0; k < data.length; k++) {
        isReapeted = false;
        if (data1[j] == data[k]) {
          isReapeted = true;
        }
      }
      if (!isReapeted) {
        data.add(data1[j]);
        data_in_english.add(data_in_english1[j]);
        isReapeted = false;
      }
    }

    for (int i = 0; i < data.length; i++) {
      textWidgetList.add(Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        child: Text(
            context.locale.languageCode == "ar" ? data[i] : data_in_english[i],
            style: TextStyle(
                color: Color.fromRGBO(32, 16, 173, 0.867),
                fontWeight: FontWeight.bold)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.7),
            border: Border.all(color: Colors.black)),
      ));
    }
//const Color.fromRGBO(204, 154, 16, 1),
    return Wrap(
      children: textWidgetList,
    );
  }

  Padding titleMethod(String text, double width, bool isClinic, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(children: [
        SizedBox(width: width * 0.08),
        Text(
          // textAlign: TextAlign.end,
          isClinic ? text : "",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black),
        ),
      ]),
    );
  }
}

class ClipPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    final path = Path();
    //(0,0) 1.Point
    path.lineTo(0, height * 0.75); //2.Point
    path.quadraticBezierTo(
      width * 0.25, //3.Point --> width * 0.5, height - 100,
      height * 0.5,
      width * 0.5, //4.Point --> width, height
      height * 0.75,
    );
    path.quadraticBezierTo(
      width * 0.75, //3.Point --> width * 0.5, height - 100,
      height,
      width, //4.Point --> width, height
      height * 0.75,
    );
    path.lineTo(width, 0); //5.Point
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

Positioned CirclesMethod(
    double offsetX, double offsetY, Color circleColor, int number) {
  return Positioned(
    left: offsetX,
    top: offsetY,
    child: Container(
      width: number == 3 ? 310 : 300,
      height: number == 3 ? 310 : 300,
      decoration: BoxDecoration(
        color: circleColor,
        shape: BoxShape.circle,
      ),
    ),
  );
}




//  ClipRRect(
//                   borderRadius: BorderRadius.circular(15.0),
//                   child: Image(
//                     height: 150.0,
//                     width: 150.0,
//                     image: AssetImage(restaurant.imageUrl),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//

// تصنيف نقاط القوة
// الحكمة والمعرفة: الإبداع والفضول والحكم وحب التعلّم وامتلاك نظرة خارجية.
// الشجاعة: البسالة والمثابرة والصدق والحماس.
// الإنسانية: الحب واللطف والذكاء الاجتماعي.
// العدالة: العمل الجماعي والإنصاف والقيادة.
// الاعتدال: التسامح والتواضع والحكمة وضبط النفس.
// السمو: تقدير الجمال والفضيلة والامتنان والأمل وروح الفكاهة والروحانية.

// أولاً- نقاط القوة، ومن أبرز الأمثلة على نقاط القوة ما يلي:
// - ثقة الفرد في ذاته وقدرته على تقديم نفسه أمام الآخرين دون خوف أو ارتباك.
// - قدرة الفرد على التأثير في الآخرين واستمالهم وجذب انتباههم.
// - التمتع بذاكرة قوية بجانب التركيز الشديد في الأمور المطروحة أمامه.
// - استجابة الفرد للمتغيرات وقدرته على التأقلم مع أصعب الظروف ومواجهتها بشجاعة.
// - امتلاك الفرد القدرة على الدفاع عن نفسه بثبات شديد دون خضوع للتأثيرات السلبية.
// - ذكاء الفرد ومواهبه المتعددة وقدرته على الاستفادة من هذه المواهب.
// ثانياً- نقاط الضعف، ومن أبرز الأمثلة على نقاط الضعف ما يلي:
// - العصبية وعدم القدرة لى ضبط الانفعالات.
// - فشل الفرد في الدفاع عن نفسه أمام الآخرين.
// - الخجل والانطوائية وعدم الرغبة في المناقشة وتبادل الأفكار والرؤى.
// - فشل الفرد في إيجاد حلول للمشكلات.
// - عدم امتلاك مهارات القيادة.
// - فشل الفرد في التعامل مع التغيرات ومواجهة التحديات.
// - عدم امتلاك قدرات عقلية متميزة.
// - الخوف من ممارسة التجارب الجديدة والافتقار لروح المغامرة.


        // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Column(
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.start,
                              //       children: [
                              //         Padding(
                              //           padding: const EdgeInsets.all(2),
                              //           child: Text(
                              //             "Clinic location".tr(),
                              //             style: TextStyle(
                              //                 fontSize: 18,
                              //                 color: Colors.black),
                              //           ),
                              //         ),
                              //         Text(
                              //           context.locale.languageCode == "ar"
                              //               ? clinicDetails.clinics_place
                              //               : clinicDetails
                              //                   .clinics_place_in_english,
                              //           style: TextStyle(
                              //               fontSize: 18,
                              //               color: Colors.black87),
                              //         ),
                              //       ],
                              //     ),
                              //     Container(
                              //       width: 2,
                              //       height: 50,
                              //       color: Colors.black54,
                              //       margin: EdgeInsets.all(10),
                              //     ),
                              //     Column(
                              //       children: [
                              //         Padding(
                              //           padding: const EdgeInsets.all(5),
                              //           child: Text(
                              //             "the Cost".tr(),
                              //             style: TextStyle(
                              //                 fontSize: 18,
                              //                 color: Colors.black),
                              //             // fontWeight: FontWeight.bold
                              //           ),
                              //         ),
                              //         Padding(
                              //           padding: const EdgeInsets.all(4),
                              //           child: Text(
                              //             clinicDetails.clinics_reward,
                              //             style: TextStyle(
                              //                 fontSize: 18,
                              //                 color: Colors.black87),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ],
                              // ),
                              ///////////////////
                              ///            // Container(
              //   // color: Colors.red,
              //   height: height / 4,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     //border: Border.all(color: Colors.black, width: 2),
              //     gradient: LinearGradient(
              //       colors: [Colors.black, Colors.white],
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       stops: [0.0, 1.0],
              //     ),
              //     //color: Colors.amber,
              //     //  borderRadius: BorderRadius.circular(20),
              //   ),
              // ),

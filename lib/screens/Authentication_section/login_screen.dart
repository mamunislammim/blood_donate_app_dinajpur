import 'package:dinajpur_blood_app/App_%20Data/app_data.dart';
import 'package:dinajpur_blood_app/State_management/riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'donor_profile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final  TextEditingController _email =  TextEditingController();
final TextEditingController _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer(builder: (_,ref,watch){
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor: AppData().mainColor2,
        body: ListView(
          padding: EdgeInsets.only(
            top: height / 4,
            left: width / 13,
            right: width / 13,
          ),
          children: [
            AppTextField(
              controller: _email,
              textStyle: GoogleFonts.acme(
                textStyle: TextStyle(
                    fontSize: 16,
                    color: AppData().whiteColor.withOpacity(.8)),
              ),         textFieldType: TextFieldType.EMAIL,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppData().whiteColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppData().whiteColor)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppData().whiteColor)),
                hintText: "email@gmail.com",
                hintStyle: GoogleFonts.acme(
                  textStyle: TextStyle(
                      color: AppData().whiteColor.withOpacity(.5)),
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: AppData().whiteColor.withOpacity(.6),
                ),
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            AppTextField(
              controller: _password,
              textStyle: GoogleFonts.acme(
                textStyle: TextStyle(
                    fontSize: 16,
                    color: AppData().whiteColor.withOpacity(.8)),
              ),
              textFieldType: TextFieldType.PASSWORD,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppData().whiteColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppData().whiteColor)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppData().whiteColor)),
                hintText: "******",
                hintStyle: GoogleFonts.acme(
                  textStyle: TextStyle(
                      color: AppData().whiteColor.withOpacity(.5)),
                ),              prefixIcon: Icon(
                Icons.security_outlined,
                color: AppData().whiteColor.withOpacity(.6),
              ),
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    surfaceTintColor: Colors.greenAccent,
                    shadowColor: AppData().mainColor2,
                    elevation: 7,
                    color: AppData().mainColor,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppData().mainColor,
                          width: 5,
                        )),
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Log In",
                              // "রক্ত",
                              style: GoogleFonts.aubrey(
                                  textStyle: TextStyle(
                                      color: AppData().whiteColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold))),
                        )),
                  ).onTap(()async{
                    if(_email.text.isEmptyOrNull){
                      toast("Enter Email Address");
                    }
                    else if(_password.text.isEmptyOrNull){
                      toast("Enter Password");
                    }
                    else if(_password.text.length < 6){
                      toast("Password at least 6 digit");
                    }
                    else{
                      ref.refresh(postRiverpod);
                      ref.refresh(donorDataRiverpod);
                      EasyLoading.show(status: "Signing In");
                      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _password.text);
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('email', _email.text);
                      var tokens = prefs.getString('email');
                      EasyLoading.showSuccess("Successful");
                      DonorProfileScreen(getTokens: tokens.toString(),).launch(context,isNewTask: true);
                    }
                  }),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Forget Password .?",
              style: GoogleFonts.acme(
                textStyle: TextStyle(
                    fontSize: 18,
                    color: AppData().whiteColor.withOpacity(.8)),
              ),
            ).onTap(() {})
          ],
        ),
      );
    });
  }
}

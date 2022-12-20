import 'package:dinajpur_blood_app/App_%20Data/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: AppData().mainColor,
      body: ListView(
        padding: EdgeInsets.only(
          top: height / 4,
          left: width / 13,
          right: width / 13,
        ),
        children: [
          AppTextField(
            controller: _email,
            textStyle: TextStyle(color: AppData().whiteColor.withOpacity(.6)),
            textFieldType: TextFieldType.EMAIL,
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
              hintStyle: TextStyle(color: AppData().whiteColor.withOpacity(.6)),
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
            textStyle: TextStyle(color: AppData().whiteColor.withOpacity(.6)),
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
              hintStyle: TextStyle(color: AppData().whiteColor.withOpacity(.6)),
              prefixIcon: Icon(
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
                child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff0c76c5),
                  ),
                  child: Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          color: AppData().whiteColor,
                          fontSize: height / 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                    EasyLoading.show(status: "Signing In");
                    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _password.text);
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('email', _email.text);
                    var tokens = prefs.getString('email');
                    EasyLoading.showSuccess("Successful");
                      DonorProfileScreen(token: tokens.toString(),).launch(context,isNewTask: true);
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
            style: TextStyle(color: AppData().whiteColor.withOpacity(.8)),
          ).onTap(() {})
        ],
      ),
    );
  }
}

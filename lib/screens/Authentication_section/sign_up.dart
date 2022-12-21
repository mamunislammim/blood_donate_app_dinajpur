import 'package:dinajpur_blood_app/screens/Authentication_section/login_screen.dart';
import 'package:dinajpur_blood_app/screens/Authentication_section/set_donor_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../App_ Data/app_data.dart';
import 'donor_profile.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

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
                child:Card(
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
                        child: Text(
                            "Sign Up",
                            // "রক্ত",
                            style: GoogleFonts.aubrey(
                                textStyle: TextStyle(
                                    color: AppData().whiteColor,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold
                                ))),
                      )),
                ).onTap(() async {
                  if (_email.text.isEmptyOrNull) {
                    toast("Enter Email Address");
                  } else if (_password.text.isEmptyOrNull) {
                    toast("Enter Password");
                  }  else if(_password.text.length < 6){
                    toast("Password at least 6 digit");
                  }
                  else {
                    try {
                      EasyLoading.show(status: "Signing Up");
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _email.text, password: _password.text);

                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('email', _email.text);

                      EasyLoading.showSuccess("Sign up Successful");
                       RegistrationScreen(getEmail: _email.text.toString(),)
                          .launch(context, isNewTask: true);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        EasyLoading.showError("The password provided is too weak");
                      } else if (e.code == 'email-already-in-use') {
                         EasyLoading.showError("The account already exists for that email");
                      }
                    }
                  }
                }),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Already have an Account ?",
                style: GoogleFonts.aubrey(
                    textStyle: TextStyle(
                        color: AppData().whiteColor.withOpacity(.8),
                        fontSize: 17,
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Log in",
                style:
                GoogleFonts.aubrey(
                    textStyle: TextStyle(
                      color: AppData().whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ).onTap(() {
              const LoginScreen().launch(context);
              }),
            ],
          )
        ],
      ),
    );
  }
}

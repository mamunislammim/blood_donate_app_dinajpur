import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:dinajpur_blood_app/App_%20Data/app_data.dart';
import 'package:dinajpur_blood_app/Models/setDonorData.dart';
import 'package:dinajpur_blood_app/State_management/riverpod.dart';
import 'package:dinajpur_blood_app/screens/Authentication_section/donor_profile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key, required this.getEmail})
      : super(key: key);
  final String getEmail;

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String? _email;
  String? _dateOfBirth;
  String? _bloodGroup;
  String? _selectGender;
  XFile? images;
  String donorImageUrl = "null";

  Future<void> takeImage() async {
    images = await _picker.pickImage(source: ImageSource.gallery);
    EasyLoading.show(status: "Uploading Image");
    var data = await FirebaseStorage.instance
        .ref("Donor Image")
        .child(DateTime.now().toString())
        .putFile(File(images!.path));
    donorImageUrl = await data.ref.getDownloadURL();
    EasyLoading.showSuccess("Image Uploaded");
    setState(() {});
  }

  @override
  void initState() {
    _email = widget.getEmail;
    super.initState();
  }

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
        body: Consumer(builder: (_, ref, watch) {
          AsyncValue<List<SetDonorDataModels>> models =
              ref.watch(donorDataRiverpod);
          return models.when(data: (data) {
            return ListView(
              padding: EdgeInsets.only(left: 8, right: 8, top: height / 15),
              children: [

                // Image
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.brown,
                            image: images == null
                                ? const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("images/userIcon.png"))
                                : DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        FileImage(File(images?.path ?? "")))),
                      ),
                      const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 35,
                      ).onTap(() {
                        takeImage();
                      })
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // Name
                Text(
                  "Enter your full Name",
                  style: GoogleFonts.maitree(
                      textStyle: TextStyle(
                          color: AppData().whiteColor,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: height / 15,
                  child: AppTextField(
                    controller: _name,
                    textAlignVertical: TextAlignVertical.bottom,
                    textStyle: GoogleFonts.questrial(
                      textStyle: TextStyle(
                          color: AppData().whiteColor.withOpacity(.7)),
                    ),
                    textFieldType: TextFieldType.NAME,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: AppData().whiteColor.withOpacity(.7),
                      ),
                      hintText: "Md. Mamun Islam ",
                      hintStyle: GoogleFonts.acme(
                        textStyle: TextStyle(
                            color: AppData().whiteColor.withOpacity(.5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppData().borderColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Text(
                  "Your Email Address",
                  style: GoogleFonts.maitree(
                      textStyle: TextStyle(
                          color: AppData().whiteColor,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: height / 15,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppData().borderColor),
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 11,
                        ),
                        Icon(Icons.mark_email_unread_outlined,
                            color: AppData().whiteColor.withOpacity(.7)),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          widget.getEmail,
                          style: GoogleFonts.gelasio(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppData().whiteColor.withOpacity(.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter your Mobile Number",
                  style: GoogleFonts.maitree(
                      textStyle: TextStyle(
                          color: AppData().whiteColor,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: height / 15,
                  child: AppTextField(
                    controller: _phone,
                    textFieldType: TextFieldType.PHONE,
                    textAlignVertical: TextAlignVertical.bottom,
                    textStyle: GoogleFonts.questrial(
                      textStyle: TextStyle(
                          color: AppData().whiteColor.withOpacity(.7)),
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.call,
                        color: AppData().whiteColor.withOpacity(.7),
                      ),
                      hintText: "01*********",
                      hintStyle: GoogleFonts.acme(
                        textStyle: TextStyle(
                            color: AppData().whiteColor.withOpacity(.5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppData().borderColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // Date Of Birth
                Text(
                  "Enter your Date of Birth",
                  style: GoogleFonts.maitree(
                      textStyle: TextStyle(
                          color: AppData().whiteColor,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: height / 15,
                  child: DateTimePicker(
                    style: GoogleFonts.questrial(
                      textStyle: TextStyle(
                          color: AppData().whiteColor.withOpacity(.7)),
                    ),
                    textAlignVertical: TextAlignVertical.bottom,
                    firstDate: DateTime(1990),
                    lastDate: DateTime.now(),
                    icon: const Icon(Icons.date_range),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: AppData().whiteColor.withOpacity(.7),
                      ),
                      hintText: "DD : MM : YYY",
                      hintStyle: GoogleFonts.acme(
                        textStyle: TextStyle(
                            color: AppData().whiteColor.withOpacity(.5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppData().borderColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _dateOfBirth = val;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // Gender & Blood
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: width / 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppData().borderColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: DropdownButton(
                          hint: Text(
                            "Gender",
                            style: TextStyle(
                                color: AppData().whiteColor.withOpacity(.7)),
                          ),
                          alignment: AlignmentDirectional.centerStart,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: AppData().whiteColor,
                          ),
                          dropdownColor: AppData().appBarColor,
                          style: GoogleFonts.questrial(
                            textStyle: TextStyle(
                                color: AppData().whiteColor.withOpacity(.7)),
                          ),
                          underline: const Text(""),
                          value: _selectGender,
                          items: const [
                            DropdownMenuItem(
                                value: "Male",
                                child: Text(
                                  "Male",
                                )),
                            DropdownMenuItem(
                                value: "Female",
                                child: Text(
                                  "Female",
                                )),
                            DropdownMenuItem(
                                value: "Custom",
                                child: Text(
                                  "Custom",
                                ))
                          ],
                          onChanged: (val) {
                            setState(() {
                              _selectGender = val;
                            });
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: width / 5.5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppData().borderColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: DropdownButton(
                          hint: Text(
                            "Blood",
                            style: TextStyle(
                                color: AppData().whiteColor.withOpacity(.7)),
                          ),
                          alignment: AlignmentDirectional.centerStart,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: AppData().whiteColor,
                          ),
                          dropdownColor: AppData().appBarColor,
                          style: GoogleFonts.questrial(
                            textStyle: TextStyle(
                                color: AppData().whiteColor.withOpacity(.7)),
                          ),
                          underline: const Text(""),
                          value: _bloodGroup,
                          items: const [
                            DropdownMenuItem(
                              value: "A+",
                              child: Text("A+"),
                            ),
                            DropdownMenuItem(
                              value: "A-",
                              child: Text("A-"),
                            ),
                            DropdownMenuItem(
                              value: "B+",
                              child: Text("B+"),
                            ),
                            DropdownMenuItem(value: "B-", child: Text("B-")),
                            DropdownMenuItem(
                                value: "AB+",
                                child: Text(
                                  "AB+",
                                )),
                            DropdownMenuItem(
                                value: "AB-",
                                child: Text(
                                  "AB-",
                                )),
                            DropdownMenuItem(
                                value: "O+",
                                child: Text(
                                  "O+",
                                )),
                            DropdownMenuItem(
                                value: "O-",
                                child: Text(
                                  "O-",
                                ))
                          ],
                          onChanged: (val) {
                            setState(() {
                              _bloodGroup = val;
                            });
                          }),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                // Address
                Text(
                  "Enter your Address",
                  style: GoogleFonts.maitree(
                      textStyle: TextStyle(
                          color: AppData().whiteColor,
                          fontWeight: FontWeight.bold)),
                ),
                AppTextField(
                  controller: _address,
                  textFieldType: TextFieldType.NAME,
                  textAlignVertical: TextAlignVertical.bottom,
                  maxLines: 2,
                  textStyle: GoogleFonts.questrial(
                    textStyle:
                        TextStyle(color: AppData().whiteColor.withOpacity(.7)),
                  ),
                  //textStyle: TextStyle(color: AppData().whiteColor),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: AppData().whiteColor.withOpacity(.7),
                    ),
                    hintText: "Enter Your Present Address",
                    hintStyle: GoogleFonts.acme(
                      textStyle: TextStyle(
                          color: AppData().whiteColor.withOpacity(.5)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppData().borderColor),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // Registration
                Card(
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
                    child: Text("Registration",
                        // "????????????",
                        style: GoogleFonts.aubrey(
                            textStyle: TextStyle(
                                color: AppData().whiteColor,
                                fontSize: 40,
                                fontWeight: FontWeight.bold))),
                  )),
                ).onTap(() async {
                  if (_name.text.isEmptyOrNull) {
                    toast("Enter Name");
                  } else if (_phone.text.isEmptyOrNull) {
                    toast("Enter Phone Number");
                  } else if (_dateOfBirth.isEmptyOrNull) {
                    toast("Enter Date of birth");
                  } else if (_selectGender.isEmptyOrNull) {
                    toast("Select Gender");
                  } else if (_bloodGroup.isEmptyOrNull) {
                    toast("Select Blood");
                  } else if (_address.text.isEmptyOrNull) {
                    toast("Enter Address");
                  } else {
                    EasyLoading.show(status: "Please Wait...");
                    SetDonorDataModels models = SetDonorDataModels(
                        _name.text,
                        _email,
                        _phone.text,
                        _selectGender,
                        _bloodGroup,
                        _dateOfBirth,
                        _address.text,
                        donorImageUrl);
                    await FirebaseDatabase.instance
                        .ref("Donor Information")
                        .push()
                        .set(models.toJson());
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('email', _email!);
                    var tokens = prefs.getString('email');
                    print("token Get : $tokens");
                    EasyLoading.showSuccess("Successful");
                    ref.refresh(donorDataRiverpod);
                    await Future<void>.delayed(Duration(seconds: 5));
                    await DonorProfileScreen(
                      getTokens: tokens.toString(),
                    ).launch(context, isNewTask: true);
                  }
                }),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          }, error: (e, stack) {
            return Center(
              child: Text(e.toString()),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
        }));
  }
}

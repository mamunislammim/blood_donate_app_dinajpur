import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:dinajpur_blood_app/App_%20Data/app_color.dart';
import 'package:dinajpur_blood_app/Models/setDonorData.dart';
import 'package:dinajpur_blood_app/screens/Authentication_section/donor_profile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../App_ Data/images.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final ImagePicker _picker = ImagePicker();
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
                          ? DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(Images().slideImages[0]))
                          : DecorationImage(
                              fit: BoxFit.fill,
                              image: FileImage(File(images?.path ?? "")))),
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
            style: TextStyle(color: AppData().whiteColor.withOpacity(.7)),
          ),
          SizedBox(
            height: height / 15,
            child: AppTextField(
              controller: _name,
              textAlignVertical: TextAlignVertical.bottom,
              textStyle: TextStyle(color: AppData().whiteColor),
              textFieldType: TextFieldType.NAME,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: AppData().whiteColor.withOpacity(.7),
                ),
                hintText: "Md. Mamun Islam ",
                hintStyle:
                    TextStyle(color: AppData().whiteColor.withOpacity(.5)),
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

          // Email Address
          Text(
            "Enter your Email Address",
            style: TextStyle(color: AppData().whiteColor.withOpacity(.7)),
          ),
          SizedBox(
            height: height / 15,
            child: AppTextField(
              controller: _email,
              textAlignVertical: TextAlignVertical.bottom,
              textStyle: TextStyle(color: AppData().whiteColor),
              textFieldType: TextFieldType.EMAIL,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mark_email_unread_outlined,
                  color: AppData().whiteColor.withOpacity(.7),
                ),
                hintText: "amarsopno678@gmail.com",
                hintStyle:
                    TextStyle(color: AppData().whiteColor.withOpacity(.5)),
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

          // Mobile Number
          Text(
            "Enter your Mobile Number",
            style: TextStyle(color: AppData().whiteColor.withOpacity(.7)),
          ),
          SizedBox(
            height: height / 15,
            child: AppTextField(
              controller: _phone,
              textFieldType: TextFieldType.PHONE,
              textAlignVertical: TextAlignVertical.bottom,
              textStyle: TextStyle(color: AppData().whiteColor),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.call,
                  color: AppData().whiteColor.withOpacity(.7),
                ),
                hintText: "01*********",
                hintStyle:
                    TextStyle(color: AppData().whiteColor.withOpacity(.5)),
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
            style: TextStyle(color: AppData().whiteColor.withOpacity(.7)),
          ),
          SizedBox(
            height: height / 15,
            child: DateTimePicker(
              style: TextStyle(color: AppData().whiteColor.withOpacity(.5)),
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
                hintStyle:
                    TextStyle(color: AppData().whiteColor.withOpacity(.5)),
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
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppData().whiteColor),
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
                    style: TextStyle(color: AppData().whiteColor),
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
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppData().whiteColor),
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
                    style: TextStyle(color: AppData().whiteColor),
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
            style: TextStyle(color: AppData().whiteColor.withOpacity(.7)),
          ),
          AppTextField(
            controller: _address,
            textFieldType: TextFieldType.NAME,
            textAlignVertical: TextAlignVertical.bottom,
            maxLines: 2,
            textStyle: TextStyle(color: AppData().whiteColor),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.location_on,
                color: AppData().whiteColor.withOpacity(.7),
              ),
              hintText: "Enter Your Present Address",
              hintStyle: TextStyle(color: AppData().whiteColor.withOpacity(.5)),
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
          Container(
              padding: const EdgeInsets.only(top: 13, bottom: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: Center(
                  child: Text(
                "Registration",
                style: TextStyle(
                    color: AppData().whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: height / 20),
              ))).onTap(() async {
            if (_name.text.isEmptyOrNull) {
              toast("Enter Name");
            } else if (_email.text.isEmptyOrNull) {
              toast("Enter Email");
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
                  _email.text,
                  _phone.text,
                  _selectGender,
                  _bloodGroup,
                  _dateOfBirth,
                  _address.text,
                  donorImageUrl);
              FirebaseDatabase.instance.ref("Donor Information").push().set(models.toJson());
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('email', _email.text);
              var tokens = prefs.getString('email');
              EasyLoading.showSuccess("Successful");
                DonorProfileScreen(token: tokens.toString(),).launch(context, isNewTask: true);

            }
          }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

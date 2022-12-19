import 'package:dinajpur_blood_app/App_%20Data/app_color.dart';
import 'package:dinajpur_blood_app/App_%20Data/images.dart';
import 'package:dinajpur_blood_app/Models/setDonorData.dart';
import 'package:dinajpur_blood_app/State_management/riverpod.dart';
import 'package:dinajpur_blood_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import 'edit_profile.dart';

class DonorProfileScreen extends StatefulWidget {
  const DonorProfileScreen({Key? key}) : super(key: key);

  @override
  State<DonorProfileScreen> createState() => _DonorProfileScreenState();
}

class _DonorProfileScreenState extends State<DonorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const CircleAvatar(
          backgroundColor: Colors.red,
          child: Icon(Icons.arrow_back),
        ).onTap(() {
          const HomePage().launch(context);
        }),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              "Edit Profile",
              style: TextStyle(
                  color: AppData().whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            )),
          ).onTap(() {
            const EditProfileScreen().launch(context);
          })
        ],
      ),
      // backgroundColor: AppData().mainColor,
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          AsyncValue<List<SetDonorDataModels>> donorData = ref.watch(donorDataRiverpod);
          return donorData.when(
              data: (data){
                return ListView(
                  padding: const EdgeInsets.only(top: 25),
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(Images().slideImages[2]),
                                  fit: BoxFit.fill)),
                        ),
                        Positioned(
                          left: 10,
                          bottom: -55,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: AppData().appBarColor,
                            backgroundImage: NetworkImage(data[1].donorImagesUrl.toString()),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, right: 10),
                          child: Text(
                            data[1].donorName.toString(),
                            style:
                            TextStyle(color: AppData().mainTextColor, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, right: 10),
                          child: Text(
                            data[1].donorEmail.toString(),
                            style: TextStyle(
                                color: AppData().mainTextColor.withOpacity(.7),
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.call,
                              color: Colors.green,
                            ),
                            Text(
                              data[1].donorPhone.toString(),
                              style:
                              TextStyle(color: AppData().mainTextColor, fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.bloodtype,
                              color: Colors.red,
                            ),
                            Text(
                              data[1].donorBloodGroup.toString(),
                              style:
                              TextStyle(color: AppData().mainTextColor, fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.account_circle_sharp,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              data[1].donorGender.toString(),
                              style:
                              TextStyle(color: AppData().mainTextColor, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppTextField(
                        textFieldType: TextFieldType.NAME,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.edit),
                            hintText: "Post here...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      " Your Posts",
                      style: TextStyle(
                          color: AppData().mainTextColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Card(
                              color: Colors.grey,
                              child: Column(
                                children: [
                                  Container(
                                    height: height / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.black, width: 3),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              Images().slideImages[3],
                                            ))),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "When the user selects an option from the dropdown list it displays the option on the button. If we want to ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                );
              },
              error: (e,stack){
                return Center(child: Text(e.toString()),);
              },
              loading: (){return const Center(child: CircularProgressIndicator(),);}
          );
        },

      )
    );
  }
}

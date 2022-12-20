import 'package:dinajpur_blood_app/App_%20Data/app_color.dart';
import 'package:dinajpur_blood_app/Models/setDonorData.dart';
import 'package:dinajpur_blood_app/State_management/riverpod.dart';
import 'package:dinajpur_blood_app/screens/Authentication_section/edit_profile.dart';
import 'package:dinajpur_blood_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

class DonorProfileScreen extends StatefulWidget {
  const DonorProfileScreen({Key? key, required this.token}) : super(key: key);

  final String token;

  @override
  State<DonorProfileScreen> createState() => _DonorProfileScreenState();
}

class _DonorProfileScreenState extends State<DonorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: AppData().appBarColor,
          child: const Icon(Icons.arrow_back),
        ).onTap(() {
          const HomePage().launch(context);
        }),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          AsyncValue<List<SetDonorDataModels>> donorData =
              ref.watch(donorDataRiverpod);
         // ref.refresh(donorDataRiverpod);

          return donorData.when(data: (data) {
            List<SetDonorDataModels> user = [];
            for (var element in data) {
              if (element.donorEmail.toString() == widget.token) {
                user.add(element);
              }
            }
            return RefreshIndicator(
                child: ListView(
                  padding: const EdgeInsets.only(top: 25),
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          height: 150,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  opacity: .8,
                                  image: NetworkImage(
                                      "https://media.gettyimages.com/id/969226260/vector/world-blood-donor-day-on-black-background-with-paper-cut-text-vector-illustration.jpg?s=612x612&w=gi&k=20&c=VfgCRfzaaTBenMFexSPdb5i5V0A9kvVQPpm8QP8gG8M="),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10, right: 8),
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 3, right: 3, left: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red.withOpacity(.8)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon((Icons.edit)),
                              Text(
                                "Edit Profile",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ).onTap(() {
                          EditProfileScreen(
                            donorData: user,
                          ).launch(context);
                        }),
                        Positioned(
                          left: 5,
                          bottom: -55,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: AppData().appBarColor,
                            backgroundImage:
                                NetworkImage(user[0].donorImagesUrl.toString()),
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
                            user[0].donorName.toString(),
                            style: TextStyle(
                                color: AppData().mainTextColor, fontSize: 20),
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
                            user[0].donorEmail.toString(),
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
                              user[0].donorPhone.toString(),
                              style: TextStyle(
                                  color: AppData().mainTextColor, fontSize: 15),
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
                              user[0].donorBloodGroup.toString(),
                              style: TextStyle(
                                  color: AppData().mainTextColor, fontSize: 15),
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
                              user[0].donorGender.toString(),
                              style: TextStyle(
                                  color: AppData().mainTextColor, fontSize: 15),
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
                                        border: Border.all(
                                            color: Colors.black, width: 3),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              user[0].donorImagesUrl.toString(),
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
                        }).visible(user[0].donorImagesUrl.toString() != "null"),
                  ],
                ),
                onRefresh: () {
                  return Future<void>.delayed(const Duration(seconds: 2));
                });
          }, error: (e, stack) {
            return Center(
              child: Text(e.toString()),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
        },
      ),
    );
  }
}

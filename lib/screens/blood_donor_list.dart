import 'package:dinajpur_blood_app/Models/setDonorData.dart';
import 'package:dinajpur_blood_app/State_management/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import '../App_ Data/app_color.dart';

class BloodDonorList extends StatefulWidget {
  const BloodDonorList({Key? key, required this.getBloodGroup})
      : super(key: key);
  final String getBloodGroup;

  @override
  State<BloodDonorList> createState() => _BloodDonorListState();
}

class _BloodDonorListState extends State<BloodDonorList> {
  int donorCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData().mainColor,
      appBar: AppBar(
        title: Text(
          "(${widget.getBloodGroup}) Donor List",
          style: TextStyle(color: AppData().whiteColor, fontSize: 25),
        ),
        backgroundColor: AppData().appBarColor,
        actions: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                  "All Donor",
                  style: TextStyle(color: AppData().whiteColor.withOpacity(.7)),
                ),
              ),
              CircleAvatar(
                backgroundColor: AppData().mainTextColor.withOpacity(.5),
                child: Text(
                  "$donorCount",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          AsyncValue<List<SetDonorDataModels>> models =
              ref.watch(donorDataRiverpod);
          return models.when(
            data: (data) {
              return RefreshIndicator(
                displacement: 200,
                strokeWidth: 5,
                backgroundColor: Colors.red,
                onRefresh: () async {
                  return Future<void>.delayed(const Duration(seconds: 3));
                },
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: data.length,
                  itemBuilder: (_, index) {
                    return Card(
                      color: Colors.white.withOpacity(.8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Circle Image
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 7, bottom: 8, left: 5),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: AppData().appBarColor,
                                backgroundImage: NetworkImage(
                                    data[index].donorImagesUrl.toString()),
                              ),
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(top: 4,left: 4,bottom: 4),
                          //   height: 70,
                          //   width: 70,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(5),
                          //       border: Border.all(color: redColor,width: 2),
                          //     image: DecorationImage(
                          //       fit: BoxFit.fill,
                          //       image: NetworkImage(data[index].donorImagesUrl.toString())
                          //     )
                          //   ),
                          // ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                  data[index].donorName.toString(),
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: AppData().mainTextColor),
                                ),
                                  Text(
                                    "Blood Group :     (${data[index].donorBloodGroup})",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppData().appBarColor),
                                  ),

                                  Text(
                                    "Given Blood 5 days ago",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppData().appBarColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Icon(
                                  Icons.call,
                                  color: Colors.green,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.sms,
                                  color: Colors.green,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ).visible(
                      data[index].donorBloodGroup.toString() ==
                          widget.getBloodGroup,
                    );
                  },
                ),
              );
            },
            error: (e, stack) {
              return Center(
                child: Text(e.toString()),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    );
  }
}

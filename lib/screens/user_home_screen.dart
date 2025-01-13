import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/home_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/pg_card.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({super.key});

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/images/logo.png",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.call,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 300.0,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayInterval: Duration(
                    seconds: 2,
                  )),
              items: _homeController.bannerImages.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All PG's",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.dark,
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _homeController.pgData.length,
                    itemBuilder: (context, index) {
                      final pg = _homeController.pgData[index];

                      return PgCard(
                        onTap: () {
                          _homeController.updatePGState(pg.name);
                          _homeController.updateNoOfSharingState(null);

                          Get.dialog(AlertDialog(
                            backgroundColor: AppColors.white,
                            title: Text("No of Sharings"),
                            content: Row(
                              children: [
                                Expanded(
                                  child: DropdownMenu(
                                    width: 250,
                                    hintText: "select no of sharings",
                                    onSelected: (value) {
                                      _homeController
                                          .updateNoOfSharingState(value);
                                    },
                                    dropdownMenuEntries: [
                                      DropdownMenuEntry(value: 1, label: "1"),
                                      DropdownMenuEntry(value: 2, label: "2"),
                                      DropdownMenuEntry(value: 3, label: "3"),
                                      DropdownMenuEntry(value: 4, label: "4"),
                                      DropdownMenuEntry(value: 5, label: "5"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                  Get.toNamed(RouteName.userAvailableRooms);
                                },
                                child: Text("Continue"),
                              ),
                            ],
                          ));
                        },
                        imageUrl: pg.imageUrl,
                        name: pg.name,
                        address: pg.address,
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

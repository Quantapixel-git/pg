import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/banner_controller.dart';
import 'package:pg/controllers/user_booking_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/center_text.dart';
import 'package:pg/widgets/loader.dart';
import 'package:pg/widgets/pg_card.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({super.key});

  final _userBookingController = Get.put(UserBookingController());
  final _bannerController = Get.find<BannerController>();
  final _pgController = Get.find<PgController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/images/logo.jpeg",
            width: 70,
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
      body: Obx(
        () => SingleChildScrollView(
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
                items: _bannerController.bannerList.map((banner) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                            banner.iamgeUrl,
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
                    _pgController.isLoading.value
                        ? const Loader()
                        : _pgController.pgList.isEmpty
                            ? CenterText(text: "No PG's Found")
                            : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _pgController.pgList.length,
                                itemBuilder: (context, index) {
                                  final pg = _pgController.pgList[index];

                                  return PgCard(
                                    onTap: () {
                                      print(pg.id);
                                      _userBookingController.updatePGState(
                                          pg.id, pg.name);
                                      _userBookingController
                                          .getMaxNumOfSharingDropdown();

                                      Get.dialog(AlertDialog(
                                        backgroundColor: AppColors.white,
                                        title: Text("No of Sharings"),
                                        content: Row(
                                          children: [
                                            Expanded(
                                              child: Obx(
                                                () => DropdownMenu(
                                                  width: 250,
                                                  hintText:
                                                      "select no of sharings",
                                                  onSelected: (value) {
                                                    _userBookingController
                                                        .updateNoOfSharingState(
                                                      value,
                                                    );
                                                  },
                                                  dropdownMenuEntries:
                                                      _userBookingController
                                                          .numberOfSharingDropdown
                                                          .map(
                                                            (item) =>
                                                                DropdownMenuEntry(
                                                              value: item,
                                                              label: item
                                                                  .toString(),
                                                            ),
                                                          )
                                                          .toList(),
                                                ),
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
                                              Get.toNamed(
                                                RouteName.userAvailableRooms,
                                              );
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
      ),
    );
  }
}

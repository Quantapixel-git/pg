import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/auth_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/user_detail_card.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({super.key});

  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.offAllNamed(RouteName.userLayout);
                },
                icon: Icon(Icons.logout))
          ],
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          title: Text("Vishal"),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColors.white,
            labelColor: AppColors.white,
            unselectedLabelColor: AppColors.white.withValues(alpha: 0.5),
            tabs: [
              Tab(
                icon: Icon(Icons.info_outline),
                text: "Information",
              ),
              Tab(
                icon: Icon(Icons.payment_outlined),
                text: "Payment History",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(16.0),
              child: UserDetailCard(
                user: _authController.user.value!,
              ),
            ),
            Container(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container();
                  },
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/user_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/admin_user_card.dart';
import 'package:pg/widgets/loader.dart';

class AdminSearchUser extends StatelessWidget {
  AdminSearchUser({super.key});

  final _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBar(
              onSubmitted: (searchTerm) {
                _userController.searchUsers(searchTerm);
              },
              leading: Icon(Icons.search_outlined),
              backgroundColor: WidgetStatePropertyAll(
                Colors.black.withValues(
                  alpha: 0.05,
                ),
              ),
              hintText: "Search for Users",
              elevation: WidgetStatePropertyAll(0),
              side: WidgetStatePropertyAll(
                BorderSide(color: AppColors.black.withValues(alpha: 0.2)),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => _userController.isLoading.value
                  ? const Loader()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _userController.searchUserList.length,
                      itemBuilder: (context, index) {
                        final user = _userController.searchUserList[index];

                        return AdminUserCard(
                          user: user,
                          onDeleteTap: (userId) {},
                          onEditTap: (user) {},
                          adminRole: null,
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/dashboard_card.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: DashboardCard(
                backgroundColor: Colors.redAccent,
                title: "Total PG's",
                count: "16",
                forgroundColor: AppColors.white,
              ),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: DashboardCard(
                backgroundColor: Colors.yellow,
                title: "Floors",
                count: "10",
                forgroundColor: AppColors.black,
              ),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: DashboardCard(
                backgroundColor: Colors.purple,
                title: "Rooms",
                count: "10",
                forgroundColor: AppColors.white,
              ),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: DashboardCard(
                backgroundColor: Colors.green,
                title: "Total Users",
                count: "1200",
                forgroundColor: AppColors.white,
              ),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: DashboardCard(
                backgroundColor: Colors.pink,
                title: "Managers",
                count: "5",
                forgroundColor: AppColors.white,
              ),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: DashboardCard(
                backgroundColor: Colors.orange,
                title: "Admins",
                count: "2",
                forgroundColor: AppColors.white,
              ),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: DashboardCard(
                backgroundColor: Colors.cyan,
                title: "Banners",
                count: "15",
                forgroundColor: AppColors.white,
              ),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: DashboardCard(
                backgroundColor: Colors.deepOrange,
                title: "Bookings",
                count: "7",
                forgroundColor: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

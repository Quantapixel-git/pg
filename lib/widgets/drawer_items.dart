import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pg/core/theme/app_colors.dart';

class DrawerItems extends StatelessWidget {
  final Function(int index) onChanged;
  final int currentIndex;

  const DrawerItems({
    super.key,
    required this.onChanged,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor:
              currentIndex == 0 ? AppColors.black.withValues(alpha: 0.2) : null,
          leading: Icon(Icons.home),
          title: const Text("Home"),
          onTap: () {
            onChanged(0);
          },
        ),
        ListTile(
          tileColor:
              currentIndex == 1 ? AppColors.black.withValues(alpha: 0.2) : null,
          leading: Icon(FontAwesomeIcons.building),
          title: const Text("PG's"),
          onTap: () {
            onChanged(1);
          },
        ),
        ListTile(
          tileColor:
              currentIndex == 2 ? AppColors.black.withValues(alpha: 0.2) : null,
          leading: Icon(FontAwesomeIcons.box),
          title: const Text('Floors'),
          onTap: () {
            onChanged(2);
          },
        ),
        ListTile(
          tileColor:
              currentIndex == 3 ? AppColors.black.withValues(alpha: 0.2) : null,
          leading: Icon(FontAwesomeIcons.restroom),
          title: const Text('Rooms'),
          onTap: () {
            onChanged(3);
          },
        ),
        ListTile(
          tileColor:
              currentIndex == 4 ? AppColors.black.withValues(alpha: 0.2) : null,
          leading: Icon(FontAwesomeIcons.user),
          title: const Text('Users'),
          onTap: () {
            onChanged(4);
          },
        ),
        ListTile(
          tileColor:
              currentIndex == 5 ? AppColors.black.withValues(alpha: 0.2) : null,
          leading: Icon(FontAwesomeIcons.image),
          title: const Text('Banners'),
          onTap: () {
            onChanged(5);
          },
        ),
        ListTile(
          tileColor:
              currentIndex == 6 ? AppColors.black.withValues(alpha: 0.2) : null,
          leading: Icon(FontAwesomeIcons.user),
          title: const Text('Sun Admin'),
          onTap: () {
            onChanged(6);
          },
        ),
        ListTile(
          tileColor:
              currentIndex == 7 ? AppColors.black.withValues(alpha: 0.2) : null,
          leading: Icon(FontAwesomeIcons.book),
          title: const Text('Bookings'),
          onTap: () {
            onChanged(7);
          },
        ),
        ListTile(
          tileColor:
              currentIndex == 8 ? AppColors.black.withValues(alpha: 0.2) : null,
          leading: Icon(Icons.search),
          title: const Text('Search User'),
          onTap: () {
            onChanged(8);
          },
        ),
        Divider(),
        ListTile(
          tileColor:
              currentIndex == 9 ? AppColors.black.withValues(alpha: 0.2) : null,
          leading: Icon(Icons.logout),
          title: const Text("Logout"),
          onTap: () {
            onChanged(9);
          },
        ),
      ],
    );
  }
}

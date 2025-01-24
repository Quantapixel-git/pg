import 'package:get/get.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/screens/admin_add_banner_screen.dart';
import 'package:pg/screens/admin_add_floor_screen.dart';
import 'package:pg/screens/admin_add_pg_screen.dart';
import 'package:pg/screens/admin_add_room_screen.dart';
import 'package:pg/screens/admin_add_sub_admin_screen.dart';
import 'package:pg/screens/admin_add_user_screen.dart';
import 'package:pg/screens/admin_banner_list_screen.dart';
import 'package:pg/screens/admin_booking_list_screen.dart';
import 'package:pg/screens/admin_edit_banner_screen.dart';
import 'package:pg/screens/admin_edit_floor_screen.dart';
import 'package:pg/screens/admin_edit_pg_screen.dart';
import 'package:pg/screens/admin_edit_room_screen.dart';
import 'package:pg/screens/admin_edit_sub_admin_screen.dart';
import 'package:pg/screens/admin_edit_user_screen.dart';
import 'package:pg/screens/admin_floor_list_screen.dart';
import 'package:pg/screens/admin_home_screen.dart';
import 'package:pg/screens/admin_login_screen.dart';
import 'package:pg/screens/admin_pg_list_screen.dart';
import 'package:pg/screens/admin_room_list_screen.dart';
import 'package:pg/screens/admin_subadmin_list_screen.dart';
import 'package:pg/screens/admin_users_list_screen.dart';
import 'package:pg/screens/book_room_screen.dart';
import 'package:pg/screens/home_screen.dart';
import 'package:pg/screens/navigation_layout.dart';
import 'package:pg/screens/user_available_rooms_screen.dart';

class Routes {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RouteName.userLayout,
      page: () => NavigationLayout(),
    ),
    GetPage(
      name: RouteName.userAvailableRooms,
      page: () => UserAvailableRoomsScreen(),
    ),
    GetPage(
      name: RouteName.bookRoom,
      page: () => BookRoomScreen(),
    ),
    GetPage(
      name: RouteName.adminHome,
      page: () => AdminHomeScreen(),
    ),
    GetPage(
      name: RouteName.adminPGList,
      page: () => AdminPgListScreen(),
    ),
    GetPage(
      name: RouteName.adminAddPG,
      page: () => AdminAddPgScreen(),
    ),
    GetPage(
      name: RouteName.adminEditPG,
      page: () => AdminEditPgScreen(),
    ),
    GetPage(
      name: RouteName.adminAddFloor,
      page: () => AdminAddFloorScreen(),
    ),
    GetPage(
      name: RouteName.adminAddRoom,
      page: () => AdminAddRoomScreen(),
    ),
    GetPage(
      name: RouteName.adminUsersList,
      page: () => AdminUsersListScreen(),
    ),
    GetPage(
      name: RouteName.adminAddUser,
      page: () => AdminAddUserScreen(),
    ),
    GetPage(
      name: RouteName.adminFloorList,
      page: () => AdminFloorListScreen(),
    ),
    GetPage(
      name: RouteName.adminEditFloor,
      page: () => AdminEditFloorScreen(),
    ),
    GetPage(
      name: RouteName.adminEditUser,
      page: () => AdminEditUserScreen(),
    ),
    GetPage(
      name: RouteName.adminEditRoom,
      page: () => AdminEditRoomScreen(),
    ),
    GetPage(
      name: RouteName.adminRoomList,
      page: () => AdminRoomListScreen(),
    ),
    GetPage(
      name: RouteName.adminBannerList,
      page: () => AdminBannerListScreen(),
    ),
    GetPage(
      name: RouteName.adminAddBanner,
      page: () => AdminAddBannerScreen(),
    ),
    GetPage(
      name: RouteName.adminSubAdminList,
      page: () => AdminSubadminListScreen(),
    ),
    GetPage(
      name: RouteName.adminAddSubAdmin,
      page: () => AdminAddSubAdminScreen(),
    ),
    GetPage(
      name: RouteName.adminUpdateSubAdmin,
      page: () => AdminEditSubAdminScreen(),
    ),
    GetPage(
      name: RouteName.adminBookingList,
      page: () => AdminBookingListScreen(),
    ),
    GetPage(
      name: RouteName.adminUpdateBanner,
      page: () => AdminEditBannerScreen(),
    ),
    GetPage(
      name: RouteName.adminLogin,
      page: () => AdminLoginScreen(),
    ),
  ];
}

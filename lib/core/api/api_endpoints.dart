class ApiEndpoints {
  // Base Url
  static final String baseUrl = "https://quantapixel.in/pg_app/api";

  // PG Endpoints
  static final String getAllPG = "/getAllCategories";
  static final String updatePG = "/updateCategory";
  static final String insertPG = "/storeCategory";
  static final String getPGById = "/getCategoryById";
  static final String deletePG = "/deleteCategory";
  static final String updateCategoryPriority = "/updateCategoryPriority";

  // Floor Endpoints
  static final String insertFloor = "/storeSubCategory";
  static final String getAllFloorsByPGId = "/getAllSubCategoriesByCategoryId";
  static final String updateFloor = "/updateSubCategory";
  static final String getAllFloors = "/getAllSubCategories";
  static final String getFloorById = "/getSubCategoryById";
  static final String deleteFloor = "/deleteSubCategory";

  // Rooms Endpoint
  static final String getAllRooms = "/getAllInnerSubCategories";
  static final String getAllRoomsByFloorId =
      "/getAllInnerSubCategoriesBySubCategoryId";
  static final String insertRoom = "/storeInnerSubCategory";
  static final String deleteRoom = "/deleteInnerSubCategory";
  static final String updateRoom = "/updateInnerSubCategory";

  // Users Endpoint
  static final String getAllUsers = "/getAllActiveUsers";
  static final String getUserById = "/getUserById";
  static final String filterUser = "/getUsersByCategory";
  static final String inserUser = "/storeUsers";
  static final String deleteUser = "/deleteUser";
  static final String updateUser = "/updateUser";
  static final String searchUsers = "/searchUsers";

  // Bnnaers Enpoint
  static final String getAllBanners = "/getAllBanners";
  static final String getBannerById = "/getBannerById";
  static final String insertBanner = "/storeBanner";
  static final String updateBanner = "/updateBanner";
  static final String deleteBanner = "/deleteBanner";

  // SubAdmin Enpoint
  static final String getAllSubAdmin = "/getAllAdmins";
  static final String getSubAdminByid = "/getAdminById";
  static final String insertSubAdmin = "/storeAdmin";
  static final String updateSubAdmin = "/updateAdmin";
  static final String deleteSubAdmin = "/deleteAdmin";

  // Booking Endpoints
  static final String getMaxNumberOfSharing = "/getMaxSharingValueByCategoryId";
  static final String getAvailableRoomsWithFloor =
      "/getFloorsWithRoomsAndLeftoverSeats";
  static final String bookPG = "/storeBooking";
  static final String getAllBookings = "/getAllBookings";

  // Authentication Routes
  static final String adminLogin = "/adminLogin";
  static final String userLogin = "/userLogin";
}

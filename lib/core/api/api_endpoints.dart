class ApiEndpoints {
  // PG Endpoints
  static final String baseUrl = "https://quantapixel.in/pg_app/api";
  static final String getAllPG = "/getAllCategories";
  static final String updatePG = "/updateCategory";
  static final String insertPG = "/storeCategory";
  static final String getPGById = "/getCategoryById";
  static final String deletePG = "/deleteCategory";
  static final String updateCategoryPriority = "/updateCategoryPriority";

  // Floor Endpoints
  static final String insertFloor = "/storeSubCategory";
  static final String updateFloor = "/updateSubCategory";
  static final String getAllFloors = "/getAllSubCategories";
  static final String getFloorById = "/getSubCategoryById";
  static final String deleteFloor = "/getSubCategoryById";
}

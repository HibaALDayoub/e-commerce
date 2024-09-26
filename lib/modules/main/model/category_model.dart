class CategoryModel {
  final String id;
  final String name;
  final String nameAr;
  final String image;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.nameAr,
      required this.image});
  //convert map to object
  factory CategoryModel.fromJson(Map<String, dynamic> jsonResponse) {
    return CategoryModel(
        id: jsonResponse[
            'categories_id'], //get the value inside the key and store it in id from category model
        name: jsonResponse['categories_name'],
        nameAr: jsonResponse['categories_name_ar'],
        image: jsonResponse['categories_image']);
  }
}

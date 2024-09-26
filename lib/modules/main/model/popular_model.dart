class PopularItemModel {
  final String idItem;
  final String nameItem;
  final String nameArItem;
  final String descriptionItem;
  final String? descriptionItemAr;
  final String priceItem;
  final String imageItem;
  final String countItem;
  final String activeItem;
  final String discountItem;
  final String dateItem;
  final String quantityItem;
  final String categoriesItem;
  final String rateItem;
  final String categoryId;
  final String categoryName;
  final String? categoryNameAr;
  final String categoryImage;
  final String? categoryDateTime;
  String? favorite;
  final String? itemFinalPrice;

  PopularItemModel(
      {required this.idItem,
      required this.nameItem,
      required this.nameArItem,
      required this.descriptionItem,
      required this.descriptionItemAr,
      required this.priceItem,
      required this.imageItem,
      required this.countItem,
      required this.activeItem,
      required this.discountItem,
      required this.dateItem,
      required this.quantityItem,
      required this.categoriesItem,
      required this.rateItem,
      required this.categoryId,
      required this.categoryName,
      required this.categoryNameAr,
      required this.categoryImage,
      required this.categoryDateTime,
      required this.favorite,
      required this.itemFinalPrice});
  //convert map to object
  factory PopularItemModel.fromJson(Map<String, dynamic> jsonResponse) {
    return PopularItemModel(
        idItem: jsonResponse["item_id"],
        nameItem: jsonResponse["item_name"],
        nameArItem: jsonResponse["item_name_ar"],
        descriptionItem: jsonResponse["item_descriprion"],
        descriptionItemAr: jsonResponse["item_descreption_ar"],
        priceItem: jsonResponse["item_price"],
        imageItem: jsonResponse["item_image"],
        countItem: jsonResponse["item_count"],
        activeItem: jsonResponse["item_active"],
        discountItem: jsonResponse["item_discount"],
        dateItem: jsonResponse["item_date"],
        quantityItem: jsonResponse["item_quantity"],
        categoriesItem: jsonResponse["item_categories"],
        rateItem: jsonResponse["item_rate"],
        categoryId: jsonResponse["categories_id"],
        categoryName: jsonResponse["categories_name"],
        categoryNameAr: jsonResponse["categories_name_ar"],
        categoryImage: jsonResponse["categories_image"],
        categoryDateTime: jsonResponse["categories_dateTime"],
        favorite: jsonResponse["favorite"],
        itemFinalPrice: jsonResponse["itemFinalPrice"]);
  }
}

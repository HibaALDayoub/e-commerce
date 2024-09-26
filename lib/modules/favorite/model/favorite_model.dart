class FavoriteModel {
  final String favoriteId;
  final String favoriteUserId;
  final String favoriteItemsId;
  final String itemId;
  final String itemName;
  final String itemNameAr;
  final String itemDescription;
  final String itemDescriptionAr;
  final String itemPrice;
  final String itemImage;
  final String itemCount;
  final String itemActive;
  final String itemDiscount;
  final String itemDate;
  final String itemQuantity;
  final String itemCategories;
  final String itemRate;
  final String userId;

  FavoriteModel({
    required this.favoriteId,
    required this.favoriteUserId,
    required this.favoriteItemsId,
    required this.itemId,
    required this.itemName,
    required this.itemNameAr,
    required this.itemDescription,
    required this.itemDescriptionAr,
    required this.itemPrice,
    required this.itemImage,
    required this.itemCount,
    required this.itemActive,
    required this.itemDiscount,
    required this.itemDate,
    required this.itemQuantity,
    required this.itemCategories,
    required this.itemRate,
    required this.userId,
  });
  factory FavoriteModel.fromJson(Map<String, dynamic> jsonResponse) {
    return FavoriteModel(
        favoriteId: jsonResponse["favorite_id"],
        favoriteUserId: jsonResponse["favorite_userId"],
        favoriteItemsId: jsonResponse["favorite_itemsId"],
        itemId: jsonResponse["item_id"],
        itemName: jsonResponse["item_name"],
        itemNameAr: jsonResponse["item_name_ar"],
        itemDescription: jsonResponse["item_descriprion"],
        itemDescriptionAr: jsonResponse["item_descreption_ar"],
        itemPrice: jsonResponse["item_price"],
        itemImage: jsonResponse["item_image"],
        itemCount: jsonResponse["item_count"],
        itemActive: jsonResponse["item_active"],
        itemDiscount: jsonResponse["item_discount"],
        itemDate: jsonResponse["item_date"],
        itemQuantity: jsonResponse["item_quantity"],
        itemCategories: jsonResponse["item_categories"],
        itemRate: jsonResponse["item_rate"],
        userId: jsonResponse["user_id"]);
  }
}

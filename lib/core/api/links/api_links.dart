import 'sub_links/auth_links.dart';

class ApiLinks with AuthLinks {
  static Map<String, String> header = {
    'Content-Type': 'application/json',
  };
  static Map<String, String> authorizedHeaders = {
    'Content-Type': 'application/json',
    // 'Authorization': "Bearer ${AppServices.accessToken}",
  };
  static const String apiVersion = 'v1';
  static const String serverLink = 'https://jostore2000.000webhostapp.com';
  static const String homeLink = '$serverLink/home.php';
  static const imageStaticLink = "https://jostore2000.000webhostapp.com/upload";
  static const categoriesImageLink = "$imageStaticLink/categories";
  static const itemsImageLink = "$imageStaticLink/items";
  static const profileImagesLink = "$imageStaticLink/usersImages/";

  static const addToFavorite = "$serverLink/favorite/addToFavorite.php";
  static const removeFromFavorite =
      "$serverLink/favorite/removeFromFavorite.php";
  static const viewFavorite = "$serverLink/favorite/viewFavorite.php";
  static const deleteFromFavorite =
      "$serverLink/favorite/deleteFromFavorite.php";
// category
  static const itemsLink = "$serverLink/items/items.php";
  // cart
  static const cartLink = "$serverLink/cart";
  static const viewCart = "$cartLink/view.php";
  static const removeCartData = "$cartLink/remove.php";
  static const addToCart = "$cartLink/add.php";
  static const getCountItemCartData = "$cartLink/getCountItem.php";
  static const couponLink = "$serverLink/coupon/checkCoupon.php";
}

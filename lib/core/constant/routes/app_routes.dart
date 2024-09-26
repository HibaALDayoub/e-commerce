import 'sub_routes/auth_routes.dart';

class AppRoutes with AuthRoutes {
  //splash
  static const String splashRoute = '/splash_route';
  static const String onBoardingRoute = '/on_boarding_route';
  //main
  static const String mainRoute = '/main_route';
  static const String driverRoute = '/driver_route';
  static const String stationsRoute = '/stations_route';
  static const String ordersRoute = '/orders_route';
  static const String addStationRoute = '/add_station_route';
  static const String addOrderRoute = '/add_order_route';
  static const String stationsDetailsRoute = '/stations_details_route';
  static const String ordersDetailsRoute = '/orders_details_route';
  static const String productDetails = '/product_details';
  static const String categoryDetails = '/category_details';
  static const String cartPage = '/Cart_page';
  // static const String favoritePage = '/favorite_page';
}

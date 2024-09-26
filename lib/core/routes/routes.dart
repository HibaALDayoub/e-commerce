import 'package:e_comerce/modules/cart/view/pages/cart_page.dart';
import 'package:e_comerce/modules/categories_detailes/view/pages/category_detailes.dart';
import 'package:e_comerce/modules/on_boarding/view/pages/on_boarding_page.dart';

import '../../modules/cart/binding/cart_binding.dart';
import '../../modules/categories_detailes/binding/category_binding.dart';
import '../../modules/complete_register/binding/complete_register_binding.dart';
import '../../modules/complete_register/view/pages/complete_register_page.dart';

import '../../modules/forget_password/binding/forget_password_binding.dart';
import '../../modules/login/binding/login_binding.dart';
import '../../modules/main/biding/main_page_binding.dart';
import '../../modules/main/view/pages/main_page.dart';
import '../../modules/on_boarding/binding/on_boarding_binding.dart';
import '../../modules/product_detailes/binding/product_details_binding.dart';
import '../../modules/product_detailes/view/pages/product_detailes.dart';
import '../../modules/sign_up/binding/sign_up_binding.dart';
import '../../modules/veryfication/binding/verification_binding.dart';
import '../../modules/veryfication/view/pages/veryfication_page.dart';
import 'routes_imports.dart';

List<GetPage<dynamic>>? routes = [
  // =====================Auth=====================
  GetPage(
      name: AppRoutes.splashRoute,
      page: () => const SplashPage(),
      transition: Transition.fade,
      binding: SplashBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoutes.onBoardingRoute,
      page: () => const OnBoardingPage(),
      transition: Transition.fade,
      binding: OnBoardingBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoutes().loginRoute2,
      page: () => LoginPage(),
      transition: Transition.fade,
      binding: LogInBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoutes().signUpRoute,
      page: () => SignUp(),
      transition: Transition.fade,
      binding: SignUpBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoutes().forgetPasswordRouteRoute,
      page: () => ForgetPassword(),
      transition: Transition.fade,
      binding: ForgetPasswordBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoutes().completeRegisterRoute,
      page: () => CompleteRegisterPage(),
      transition: Transition.fade,
      binding: CompleteRegisterBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoutes().verificationRoute,
      page: () => VerificationPage(),
      transition: Transition.fade,
      binding: VerificationBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoutes.mainRoute,
      page: () => MainPage(),
      // transition: Transition.fade,
      binding: MainPageBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoutes.productDetails,
      page: () => ProductDetails(),
      // transition: Transition.fade,
      binding: ProductDetailsBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoutes.categoryDetails,
      page: () => const CategoryDetails(),
      // transition: Transition.fade,
      binding: CategoryBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoutes.cartPage,
      page: () => const CartPage(),
      // transition: Transition.fade,
      binding: CartBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
];

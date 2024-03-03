import 'package:get/get.dart';
import 'package:t_store/routes/routes.dart';

import '../features/authentication/screens/signup.widgets/signup.dart';
import '../features/authentication/screens/signup.widgets/verify_email.dart';
import '../features/shop/screens/Product_details/product_detail.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/login/login.dart';
import '../features/shop/screens/onboarding/onboarding.dart';
import '../features/shop/screens/profile/profile.dart';
import '../features/shop/screens/widgets/cart.dart';
import '../features/shop/screens/wishlist/wishlist.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    // GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    // GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: TRoutes.productDetail, page: () => const ProductDetailScreen()),
    // GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    // GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    // GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    // GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
import 'package:app_order/presentation/screen/cart/cart_screen.dart';
import 'package:app_order/presentation/screen/favorite/favorite_screen.dart';
import 'package:app_order/presentation/screen/home/home_screen.dart';
import 'package:app_order/presentation/screen/profile/profile_screen.dart';
import 'package:app_order/presentation/screen/search/search_screen.dart';
import 'package:get/get.dart';

class LandingScreenController extends GetxController {
  final List listScreen =  [
    HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    CartScreen(),
    const ProfileScreen()
  ];
}

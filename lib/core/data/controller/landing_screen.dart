import 'package:app_order/presentation/cart/cart_screen.dart';
import 'package:app_order/presentation/favorite/favorite_screen.dart';
import 'package:app_order/presentation/home/home_screen.dart';
import 'package:app_order/presentation/profile/profile_screen.dart';
import 'package:app_order/presentation/search/search_screen.dart';
import 'package:get/get.dart';

class LandingScreenController extends GetxController {
  final List listScreen =  [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen()
  ];
}

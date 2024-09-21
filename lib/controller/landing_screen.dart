import 'package:app_order/view/cart_screen.dart';
import 'package:app_order/view/favorite_screen.dart';
import 'package:app_order/view/home_screen.dart';
import 'package:app_order/view/search_screen.dart';
import 'package:get/get.dart';

class LandingScreenController extends GetxController {
  final List listScreen = const [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    CartScreen()
  ];
}

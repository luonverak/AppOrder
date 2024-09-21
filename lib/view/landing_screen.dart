import 'package:app_order/controller/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});

  final screenController = Get.put(LandingScreenController());
  final RxInt _index = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screenController.listScreen[_index.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border, color: Colors.black),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart, color: Colors.black),
              label: "Cart",
            )
          ],
          currentIndex: _index.value,
          selectedItemColor: Colors.black,
          onTap: (value) {
            _index.value = value;
          },
        ),
      ),
    );
  }
}

import 'package:app_order/core/data/controller/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

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
              activeIcon: Icon(Icons.home, color: Colors.blueAccent),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black),
              label: "Search",
              activeIcon: Icon(Icons.search, color: Colors.blueAccent),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border, color: Colors.black),
              label: "Favorite",
              activeIcon: Icon(Icons.favorite_border, color: Colors.blueAccent),
            ),
            BottomNavigationBarItem(
              icon: badges.Badge(
                badgeContent: Text(
                  '0',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                child: Icon(Icons.shopping_cart, color: Colors.black),
              ),
              label: "Cart",
              activeIcon: badges.Badge(
                badgeContent: Text(
                  '0',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                child: Icon(Icons.shopping_cart, color: Colors.blueAccent),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black),
              label: "Profile",
              activeIcon: Icon(Icons.person, color: Colors.blueAccent),
            )
          ],
          currentIndex: _index.value,
          selectedItemColor: Colors.blueAccent,
          onTap: (value) {
            _index.value = value;
          },
        ),
      ),
    );
  }
}

import 'package:app_order/core/data/controller/address_controller.dart';
import 'package:app_order/core/theme/font_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final currentAddress = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                Obx(
                  () =>
                      FontApp.smallText12(currentAddress.currentAddress.value),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

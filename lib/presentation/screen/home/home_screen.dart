import 'package:app_order/core/data/controller/address_controller.dart';
import 'package:app_order/core/theme/color_app.dart';
import 'package:app_order/core/theme/font_app.dart';
import 'package:app_order/helper/screen_space.dart';
import 'package:app_order/presentation/widget/slide_widget.dart';
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
                    () => FontApp.smallText16(
                        currentAddress.currentAddress.value),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: slideWidget(),
            ),
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: ScreenSpace.spaceAround(top: 30),
            //     child: Container(
            //       height: 55,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         color: ColorApp.second,
            //       ),
            //       child: const TextField(
            //         decoration: InputDecoration(
            //           border: InputBorder.none,
            //           contentPadding: EdgeInsets.symmetric(horizontal: 10),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
            
          ],
        ),
      ),
    );
  }
}

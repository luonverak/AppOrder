import 'package:app_order/core/data/controller/address_controller.dart';
import 'package:app_order/core/data/controller/status_controller.dart';
import 'package:app_order/core/data/model/category_mode.dart';
import 'package:app_order/core/theme/color_app.dart';
import 'package:app_order/core/theme/font_app.dart';
import 'package:app_order/helper/screen_space.dart';
import 'package:app_order/presentation/widget/slide_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final currentAddress = Get.put(AddressController());
  final statusController = Get.put(StatusController());
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
            SliverToBoxAdapter(
              child: Padding(
                padding: ScreenSpace.spaceAround(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FontApp.smallText18("Choose category"),
                    FontApp.smallText14("view more")
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    listCategory.length,
                    (index) => Padding(
                      padding: ScreenSpace.spaceAround(top: 10),
                      child: GestureDetector(
                          onTap: () {
                            if (statusController.active.value) {
                              statusController.inactiveStatus();
                            } else {
                              statusController.activeStutus();
                              listCategory[index].status.value =
                                  statusController.active.value;
                            }
                          },
                          child: Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                color: listCategory[index].status.value
                                    ? ColorApp.primary
                                    : ColorApp.second,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: ScreenSpace.spaceContent(
                                    right: 15, left: 15),
                                child: FontApp.smallText16(
                                    listCategory[index].title),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

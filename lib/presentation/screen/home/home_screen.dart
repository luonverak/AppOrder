import 'package:app_order/core/data/controller/address_controller.dart';
import 'package:app_order/core/data/controller/product_controller.dart';
import 'package:app_order/core/data/controller/status_controller.dart';
import 'package:app_order/core/data/model/category_mode.dart';
import 'package:app_order/core/data/model/product_model.dart';
import 'package:app_order/core/theme/color_app.dart';
import 'package:app_order/core/theme/font_app.dart';
import 'package:app_order/helper/screen_space.dart';
import 'package:app_order/presentation/screen/detail/detail_screen.dart';
import 'package:app_order/presentation/widget/slide_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final currentAddress = Get.put(AddressController());
  final statusController = Get.put(StatusController());
  final productController = Get.put(ProductController());

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
              child: Padding(
                padding: ScreenSpace.spaceAround(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      listCategory.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 10, top: 5),
                        child: GestureDetector(
                            onTap: () {
                              for (int i = 0; i < listCategory.length; i++) {
                                if (i == index) {
                                  listCategory[index].status.value = true;
                                } else {
                                  listCategory[i].status.value = false;
                                }
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
                                    listCategory[index].title,
                                    color: listCategory[index].status.value
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: productController.list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: ScreenSpace.spaceAround(buttom: 10, top: 20),
                  child: Obx(
                    () => Visibility(
                      visible: productController.status.value,
                      replacement: _buildProduct(productController.list[index]),
                      child: const Center(
                        child: Text("Loading"),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProduct(ProductModel productModel) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(productModel.image),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: ColorApp.dark,
                  ),
                  child: Padding(
                    padding: ScreenSpace.spaceLeftRigth(),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        FontApp.smallText16(productModel.rate.toString(),
                            color: Colors.white)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                height: 100,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Positioned(
                      top: -30,
                      right: -60,
                      child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 150,
                        color: Colors.red,
                        transform: Matrix4.rotationZ(0.7),
                        child: FontApp.smallText18(
                          productModel.discount,
                          color: ColorApp.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.56),
                  blurRadius: 10,
                )
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: ScreenSpace.spaceLeftRigth(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          DetailScreen(
                            productID: productModel.id,
                          ),
                        );
                      },
                      child: FontApp.smallText18(
                        productModel.name,
                        color: ColorApp.white,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: FontApp.smallText18("Add", color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:app_order/core/data/controller/product_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.productID});
  final int productID;

  final productController = Get.put(ProductController());

  // @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      initState: (state) {
        productController.onGetProductDetail(id: productID);
      },
      init: productController,
      builder: (controller) {
        final product = productController.product;
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(product?.name ?? ""),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300,
                        color: Colors.white,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: product?.image ?? "",
                          placeholder: (context, url) =>
                              Lottie.asset("asset/icon/loading.json"),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$ ${product?.price}",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "${product?.discount}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  "${product?.rate}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
              onPressed: () {
                productController.addToCart(product!);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Padding(
                padding: EdgeInsets.all(13.0),
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

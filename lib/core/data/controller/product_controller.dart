import 'package:app_order/core/data/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductModel> list = <ProductModel>[].obs;
  RxBool status = true.obs;
  late ProductModel? product;

  Future<void> onGetProduct() async {
    try {
      if (listProduct.isEmpty) {
        list.value = [];
        return;
      }
      list.value = listProduct;
      status.value = false;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onGetProductDetail({required int id}) async {
    try {
      product = list.where((p) => p.id == id).firstOrNull;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onInit() {
    onGetProduct();
    super.onInit();
  }
}

import 'package:dw_delivery_flutter/app/models/product_model.dart';

abstract class ProductsRepo {
  Future<List<ProductModel>> findAllProducts();
}

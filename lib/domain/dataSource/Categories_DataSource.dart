import 'package:route_task/domain/Model/Product.dart';

abstract class CategoriesDataSource {
  Future<ProductResponse?> getProducts();
}
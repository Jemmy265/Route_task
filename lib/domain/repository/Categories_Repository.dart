import 'package:route_task/domain/Model/Product.dart';

abstract class CategoriesRepository {
  Future<ProductResponse?> getProducts();
}
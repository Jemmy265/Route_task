import 'package:injectable/injectable.dart';
import 'package:route_task/domain/Model/Product.dart';
import 'package:route_task/domain/dataSource/Categories_DataSource.dart';
import 'package:route_task/domain/repository/Categories_Repository.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesDataSource categoriesDataSource;

  CategoriesRepositoryImpl(this.categoriesDataSource);
  @override
  Future<ProductResponse?> getProducts() async{
    return categoriesDataSource.getProducts();
  }
}
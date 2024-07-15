import 'package:injectable/injectable.dart';
import 'package:route_task/api/api_manager.dart';
import 'package:route_task/domain/Model/Product.dart';
import 'package:route_task/domain/Model/Products.dart';
import 'package:route_task/domain/dataSource/Categories_DataSource.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesOnlineDataSource implements CategoriesDataSource {
  ApiManager apiManager;

  CategoriesOnlineDataSource(this.apiManager);
  @override
  Future<ProductResponse?> getProducts() async{
    var response = await apiManager.getProducts();
    return response;
  }

}
import 'package:injectable/injectable.dart';
import 'package:route_task/domain/Model/Product.dart';
import 'package:route_task/domain/repository/Categories_Repository.dart';

@injectable
class GetCategoriesUseCase {
CategoriesRepository repository;

GetCategoriesUseCase(this.repository);
Future<ProductResponse?> invoke() async{
  return repository.getProducts();
}
}
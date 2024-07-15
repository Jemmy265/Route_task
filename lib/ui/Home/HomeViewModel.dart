import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/domain/usecase/CategoriesUsecase.dart';
import 'package:route_task/ui/Home/HomeStates.dart';

@injectable
class HomeViewModel extends Cubit<HomeViewState>{
  GetCategoriesUseCase getCategoriesUseCase;

  HomeViewModel(this.getCategoriesUseCase):super(InitialState());
  void getAllProducts()async{
    emit(LoadingState());
    try{
      var products = await getCategoriesUseCase.invoke();
      emit(SuccessState(products));
    }catch (ex) {
      emit(FailState(message: ex.toString()));
    }
  }

}
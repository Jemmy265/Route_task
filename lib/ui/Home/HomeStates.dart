import 'package:route_task/domain/Model/Product.dart';

abstract class HomeViewState {}

class InitialState extends HomeViewState {

}

class LoadingState extends HomeViewState {
  String? loadingMessage;
  LoadingState({this.loadingMessage});
}

class SuccessState extends HomeViewState {
  ProductResponse? products;

  SuccessState(this.products);
}

class FailState extends HomeViewState {
  String? message;

  FailState({this.message});
}
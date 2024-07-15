import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/api/api_manager.dart';
import 'package:route_task/di/di.dart';
import 'package:route_task/domain/Model/Product.dart';
import 'package:route_task/ui/Home/HomeStates.dart';
import 'package:route_task/ui/Home/HomeViewModel.dart';
import 'package:route_task/ui/components/Error_widget.dart';
import 'package:route_task/ui/components/InfiniteLoadingWidget.dart';
import 'package:route_task/ui/components/custom_form_field.dart';
import 'package:route_task/ui/components/product_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = getIt<HomeViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.getAllProducts();
  }
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFFFFFF),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,

            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset(
                'assets/images/routeLogo.png',
              ),
            ),
            backgroundColor: const Color(0xffFFFFFF),
          ),
          backgroundColor: const Color(0xffFFFFFF),
          body: BlocBuilder<HomeViewModel,HomeViewState>(
            bloc: viewModel,
              builder:(context, state) {
                if(state is LoadingState){
                  return InfiniteLoadingWidget(loadingMessage: "",);
                }else if (state is InitialState) {
                  return InfiniteLoadingWidget(
                    loadingMessage: "",
                  );

              }else if(state is SuccessState){
                  return buildSuccessWidget(state.products!);
                }
                else if(state is FailState){
                  return ExceptionWidget("Error");
                }

                return Container();
              }
          ),
        ),
      ),
    );
  }

  Widget buildSuccessWidget(ProductResponse productResponse){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomFormField(
                  controller: searchController,
                  prefix: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(
                        'assets/images/search.png'),
                  ),
                  hintText: 'what do you search for?',
                  borderSideColor: const Color(0xff004182),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Image.asset('assets/images/cart.png'),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: productResponse.products?.length??0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: .8
              ), itemBuilder:(context, index) {
              return ProductWidget(product: productResponse.products![index]);
            },),
          ),
        ],
      ),
    );
  }
}

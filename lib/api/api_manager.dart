import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/api/interceptor/Logging_Interceptor.dart';
import 'package:route_task/domain/Model/Product.dart';
import 'package:route_task/ui/components/Error_widget.dart';

@singleton
class ApiManager {
  static const String baseUrl = "dummyjson.com";
  http.Client client =
  InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Future<ProductResponse?> getProducts() async {
    var url = Uri.https(baseUrl, "/products");
    try {
      var response = await client.get(url);
      return ProductResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e.toString());
      throw ExceptionWidget(e.toString());
    }
  }
}
import 'dart:developer';
import 'package:bookia/features/home/data/models/book_list_response/book_list_response.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';
import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';

class HomeRepo {
  static Future<SliderResponse?> getSliders() async {
    try {
      
      var res = await DioProvider.get(endpoint: ApiEndpoints.sliders);
      
      if (res.statusCode == 200) {
        return SliderResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BookListResponse?> getBestSellers() async {
    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.productsBestSeller,
      );
      if (res.statusCode == 200) {
        return BookListResponse.fromJson(res.data);
        
      } else {
        return null;
      }
      
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BookListResponse?> getNewArrivals() async {
    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.productsNewArrival,
      );

      if (res.statusCode == 200) {
        return BookListResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BookListResponse?> getAllBooks([int pageIndex = 1]) async {

    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.allProducts,
        queryParameters: {'page': pageIndex},
      );

      if (res.statusCode == 200) {
        return BookListResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
import 'dart:developer';
import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/features/wishlist/data/models/wishlist_response/wishlist_response.dart';

class WishlistRepo {


  static Future<WishlistResponse?> getWishlistBooks() async {
    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.wishlist,

        headers: {
          "Authorization": "Bearer ${LocalHelper.getUserData()?.token}",
        },
      );

      // log("⬅️ Response status: ${res.statusCode}");
      // log("⬅️ Response data: ${res.data}");

      if (res.statusCode == 200) {
        // var data = WishlistResponse.fromJson(res.data);
        // LocalHelper.setWishlist(data.data?.data);
        return WishlistResponse.fromJson(res.data);
      } else {
        return null;
      }
    } catch (e, stack) {
      log("❌ Exception: $e");
      log("📌 Stacktrace: $stack");
      return null;
    }
  }
    static Future<WishlistResponse?> addToWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.addToWishlist,
        data: {"product_id": productId},
      );

      if (res.statusCode == 200) {
        var data = WishlistResponse.fromJson(res.data);
        LocalHelper.setWishlist(data.data?.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
  static Future<WishlistResponse?> removeFromWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.removeFromWishlist,
        data: {"product_id": productId},
      );

      if (res.statusCode == 200) {
        var data = WishlistResponse.fromJson(res.data);
        LocalHelper.setWishlist(data.data?.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}

import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/local/local_helper.dart';

class WishlistRepo {
  static addToWishlist() {}
  static removeFromWishlist() {}
  static getWishList() async {
    try {
      log("➡️ Sending request to ${ApiEndpoints.wishlist}");
      log(
        "➡️ Headers: ${{"Authorization": "Bearer ${LocalHelper.getUserData()?.token}"}}",
      );
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.wishlist,
        // data: {
        // //  "product_id": productId,
        // },
        headers: {
          "Authorization": "Bearer ${LocalHelper.getUserData()?.token}",},
      );

      log("⬅️ Response status: ${res.statusCode}");
      log("⬅️ Response data: ${res.data}");

      if (res.statusCode == 200) {
        return res.data;
      } else {
        return null;
      }
    } catch (e, stack) {
      log("❌ Exception: $e");
      log("📌 Stacktrace: $stack");
      return null;
    }
  }
  // static Future<WishlistResponse?> addToWishlist({
  //   required int productId,
  // }) async {
  //   try {
  //     var res = await DioProvider.post(endpoint: ApiEndpoints.addToWishlist,data:"" ,headers:{

  //     } );
  //   } catch (e) {

  //   }
  // }
}

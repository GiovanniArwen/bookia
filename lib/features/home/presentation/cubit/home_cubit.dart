import 'dart:developer';

import 'package:bookia/features/home/data/models/book_list_response/book_list_response.dart';
import 'package:bookia/features/home/data/models/book_list_response/product.dart';
import 'package:bookia/features/home/data/models/slider_response/slider.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInital());

  List<SliderModel> sliders = [];
  List<Product> bestSellers = [];
  List<Product> newArrivals = [];
  List<Product> allbooks = [];

  Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      var res = await Future.wait([
        HomeRepo.getSliders(),
        HomeRepo.getBestSellers(),
        HomeRepo.getNewArrivals(),
        HomeRepo.getAllBooks(),
      ]);

      sliders = (res[0] as SliderResponse).data?.sliders ?? [];
      bestSellers = (res[1] as BookListResponse).data?.products ?? [];
      newArrivals = (res[2] as BookListResponse).data?.products ?? [];
      allbooks = (res[3] as BookListResponse).data?.products ?? [];

      emit(HomeLoaded());
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeError(message: ''));
    }
  }

  addToWishlist(int productId) async {
    emit(HomeLoaded());
    var data = await WishlistRepo.addToWishlist(productId: productId);
    if (data != null) {
      emit(AddToWishlistSuccessState());
    } else {
      emit(HomeError(message: "Something went wrong"));
    }
  }
  //   addRemoveToWishlist(int productId) async {
  //   emit(HomeLoading());

  //   if (isWishlist(productId)) {
  //     var data = await WishlistRepo.removeFromWishlist(productId: productId);
  //     if (data != null) {
  //       emit(WishlistCartSuccessState(message: 'Removed from wishlist'));
  //     } else {
  //       emit(HomeError(message: "Something went wrong"));
  //     }
  //   } else {
  //     var data = await WishlistRepo.addToWishlist(productId: productId);
  //     if (data != null) {
  //       emit(WishlistCartSuccessState(message: 'Added to wishlist'));
  //     } else {
  //       emit(HomeError(message: "Something went wrong"));
  //     }
  //   }
  // }

  //   addToCart(int productId) async {
  //   emit(HomeLoading());

  //   var data = await cartrepo.addToCart(productId: productId);
  //   if (data != null) {
  //     emit(WishlistCartSuccessState(message: 'Added to Cart'));
  //   } else {
  //     emit(HomeError(message: "Something went wrong"));
  //   }
  // }

  // bool isWishlist(int productId) {
  //   var wishlist = LocalHelper.getWishlist();

  //   return wishlist?.any((e) => e.id == productId) ?? false;
  // }
}

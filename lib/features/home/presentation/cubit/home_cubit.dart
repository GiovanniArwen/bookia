import 'dart:developer';

import 'package:bookia/features/home/data/models/book_list_response/book_list_response.dart';
import 'package:bookia/features/home/data/models/book_list_response/product.dart';
import 'package:bookia/features/home/data/models/slider_response/slider.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInital());

  List<Slider> slider = [];
  List<Product> bestSellers = [];
  List<Product> newArrivals = [];
  List<Product> allbooks = [];

  Future<void> getHomeData() async {
    emit(HomeLoading());
    log('-1-');
    try {
      log('-----2-----');

      var res = await Future.wait([
        HomeRepo.getSliders(),
        HomeRepo.getBestSellers(),
        HomeRepo.getNewArrivals(),
        HomeRepo.getAllBooks(),

      ]);
      log('-----3-----');

      slider = (res[0] as SliderResponse).data?.sliders??  [];
      bestSellers = (res[1] as BookListResponse).data?.products ?? [];
      newArrivals = (res[2] as BookListResponse).data?.products ?? [];
      allbooks = (res[3] as BookListResponse).data?.products ?? [];


      emit(HomeLoaded());
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeError());
    }
  }
}

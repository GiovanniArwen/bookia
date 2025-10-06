import 'package:bookia/features/home/data/models/book_list_response/product.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());
  List<Product> books = [];

  getWishlist()
  {
    emit(WishlistLoadingState());
    WishlistRepo.getWishlistBooks().then((value){
      if (value == null) {
        emit(WishlistErrorState(message: "something went wrong"));

      }
      else{
        books = value.data?.data ?? [];
        emit(WishlistSuccessState());
      }
    });
  }
}

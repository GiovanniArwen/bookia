class HomeState {}

class HomeInital extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {}
class AddToWishlistSuccessState extends HomeState {}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}

class WishlistCartSuccessState extends HomeState {
  final String message;
  WishlistCartSuccessState({required this.message});
}

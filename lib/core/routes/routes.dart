import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/page/forgetPassword/forget_password.dart';
import 'package:bookia/features/auth/presentation/page/login/login.dart';
import 'package:bookia/features/auth/presentation/page/otp/OTP.dart';
import 'package:bookia/features/auth/presentation/page/register/register.dart';
import 'package:bookia/features/auth/presentation/page/reset_password/reset_password.dart';
import 'package:bookia/features/auth/presentation/page/successPassword/success_password.dart';
import 'package:bookia/features/home/data/models/book_list_response/product.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/details/page/book_details.dart';
import 'package:bookia/features/main/presentation/page/main_screen.dart';
import 'package:bookia/features/splash/splash.dart';
import 'package:bookia/features/welcome/welcome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splash = "/";
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String register = "/register";
  static const String main = "/main";
  static const String forgetPassword = "/forget_password";
  static const String otp = "/OTP";
  static const String resetPassword = "/reset_password";
  static const String successPassword = "/success_password";
  static const String bookDetails = "/book_details";

  static final routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: welcome, builder: (context, state) => Welcome()),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) =>
            BlocProvider(create: (context) => AuthCubit(), child: Register()),
      ),
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: ForgetPassword(),
        ),
      ),
      GoRoute(
        path: otp,
        builder: (context, state) {
          final email = state.extra as String;
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: Otp(email: email),
          );
        },
      ),
      GoRoute(
        path: resetPassword,
        builder: (context, state) {
          final otp = state.extra as String;
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: ResetPassword(otp: otp),
          );
        },
      ),
      GoRoute(
        path: successPassword,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: SuccessPassword(),
          );
        },
      ),

      GoRoute(path: main, builder: (context, state) => MainScreen()),
      GoRoute(
        path: bookDetails,
        builder: (context, state) {
          var args = state.extra as Map<String, dynamic>;
          return BlocProvider(
            create: (context) => HomeCubit(),
            child: BookDetails(
              product: args["product"] as Product,
              source: args["source"] as String,
            ),
          );
        },
      ),
    ],
  );
}

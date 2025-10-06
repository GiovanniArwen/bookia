import 'package:bookia/components/app_bar/app_barwith_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/customTextFIeld.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/extensions/show_dialoug.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarwithBack(),
      body: BlocListener<AuthCubit, AuthState>(
        listener: blocListener,
        child: loginBody(),
      ),
      bottomNavigationBar: _orSignUp(context),
    );
  }

  void blocListener(BuildContext context, AuthState state) {
    if (state is AuthSuccessState) {
      PushAndRemoveUntil(context, Routes.main);
    } else if (state is AuthErrorState) {
      Pop(context);
      showerror(context, state.error);
    } else {
      showloading(context);
    }
  }

  Padding loginBody() {
    var cubit = context.read<AuthCubit>();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              Text(
                'Welcome back! Glad to see you, Again',
                style: TextStyles.size30(),
              ),
              Gap(30),
              Customtextfield(
                controller: cubit.emailController,
                hintText: 'Enter Your Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              Gap(20),
              Customtextfield(
                controller: cubit.passwordController,
                hintText: 'Enter Your Password',
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      context.push(Routes.forgetPassword);
                    },
                    child: Text('Forget Password?', style: TextStyles.size16()),
                  ),
                ],
              ),
              Gap(30),
              MainButton(
                text: 'Login',
                fontsize: 12,
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.login();
                  }
                },
              ),
              Gap(38),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Text('Or Login With ', style: TextStyles.size16()),
                  Expanded(child: Divider()),
                ],
              ),
              Gap(30),
              socialbuttons(),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea _orSignUp(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account? ", style: TextStyles.size16()),
          TextButton(
            onPressed: () {
              pushWithRelacement(context, Routes.register);
            },
            child: Text(
              'Sign Up',
              style: TextStyles.size16(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Row socialbuttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 18,
      children: [
        SocialButton(iconPath: AppAssets.facebook, onTap: () {}),
        SocialButton(iconPath: AppAssets.google, onTap: () {}),
        SocialButton(iconPath: AppAssets.apple, onTap: () {}),
      ],
    );
  }
}

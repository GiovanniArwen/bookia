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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Pop(context);
          },
          child: Image.asset(AppAssets.back, width: 41, height: 41),
        ),
      ),

      body: BlocListener<AuthCubit, AuthState>(
        listener: blocListener,
        child: signupBody(),
      ),
      bottomNavigationBar: _OrLogin(context),
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

  Padding signupBody() {
    var cubit = context.read<AuthCubit>();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: cubit.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello! Register to get\nstarted',
                style: TextStyles.size30(),
              ),
              Gap(30),
              Customtextfield(
                controller: cubit.usernameController,
                hintText: 'Username',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              Gap(20),
              Customtextfield(
                controller: cubit.emailController,
                hintText: 'Email',
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
                hintText: 'Password',
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Gap(20),
              Customtextfield(
                controller: cubit.passwordConfirmationController,
                hintText: 'Confirm Password',
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Confirmation password';
                  }
                  return null;
                },
              ),
              Gap(30),
              MainButton(
                text: 'Register',
                fontsize: 12,
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.register();
                  }
                },
              ),
              Gap(38),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea _OrLogin(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already have an account?", style: TextStyles.size16()),
          TextButton(
            onPressed: () {
              pushWithRelacement(context, Routes.login);
            },
            child: Text(
              'Sign in',
              style: TextStyles.size16(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';
import 'package:chat_pro/core/routes.dart';
import 'package:chat_pro/core/utils/color_assets.dart';
import 'package:chat_pro/core/utils/string_assets.dart';
import 'package:chat_pro/features/authentication/presentation/widgets/custom_button.dart';
import 'package:chat_pro/features/authentication/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorAssets.backgroundColor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70.h, bottom: 50.h),
                child: Icon(Icons.home_repair_service,
                    color: ColorAssets.basicColor, size: 100.h),
              ),
              const LoginFields(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Login fields
class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade700.withOpacity(0.5),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: [
              Text(
                StringAssets.login,
                style: TextStyle(fontSize: 25.sp, color: Colors.white),
              ),
              const CustomTextField(icon: Icons.email, placeholder: StringAssets.email,textInputType: TextInputType.emailAddress),
              const CustomTextField(
                  icon: Icons.password, placeholder: StringAssets.password),
              const ForgotPasswordText(),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 15.h),
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: const CustomButton(text: StringAssets.login)),
              const RegistrationText(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Registration text
class RegistrationText extends StatelessWidget {
  const RegistrationText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.popAndPushNamed(context, AppRoutes.signUpScreen),
      child: Text(
        StringAssets.pleaseRegisterText,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 15.h,fontWeight: FontWeight.bold),
      ),
    );
  }
}

/// Registration text
class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            StringAssets.forgotPassword,
            style: TextStyle(color: Colors.white, fontSize: 15.h,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

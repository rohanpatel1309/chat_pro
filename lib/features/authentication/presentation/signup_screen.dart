import 'dart:ui';

import 'package:chat_pro/core/routes.dart';
import 'package:chat_pro/core/utils/string_assets.dart';
import 'package:chat_pro/features/authentication/presentation/widgets/custom_button.dart';
import 'package:chat_pro/features/authentication/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                child: Icon(Icons.home_repair_service,
                    color: Colors.deepOrange, size: 100.h),
              ),
              const SignUpFields(),
            ],
          ),
        ),
      ),
    );
  }
}

/// SignUp fields
class SignUpFields extends StatelessWidget {
  const SignUpFields({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade700.withOpacity(0.5),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Column(
              children: [
                const CustomTextField(icon: Icons.person, placeholder: StringAssets.name),
                const CustomTextField(icon: Icons.phone, placeholder: StringAssets.phoneNo,textInputType: TextInputType.phone),
                const CustomTextField(icon: Icons.email, placeholder: StringAssets.email,textInputType: TextInputType.emailAddress),
                const CustomTextField(
                    icon: Icons.password, placeholder: StringAssets.password),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 25.h),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: const CustomButton(text: StringAssets.createAccount)),
                const RegistrationText(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Login text
class RegistrationText extends StatelessWidget {
  const RegistrationText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.loginScreen),
      child: Text(
        StringAssets.pleaseLoginText,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 15.h,fontWeight: FontWeight.bold),
      ),
    );
  }
}

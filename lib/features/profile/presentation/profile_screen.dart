import 'dart:ui';

import 'package:chat_pro/core/utils/color_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorAssets.backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: const Column(
          children: [
            ProfileIconName(),
            ProfileFields(),
          ],
        ),
      ),
    );
  }
}

class ProfileIconName extends StatelessWidget {
  const ProfileIconName({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 35.h,bottom: 30.h),
      child: Column(
        children: [
          Icon(Icons.person_2_sharp,size: 150.h,color: Colors.white.withOpacity(0.5),),
          Text("Rohan",style: TextStyle(color: Colors.white,fontSize: 24.sp),)
        ],
      ),
    );
  }
}


class ProfileFields extends StatelessWidget {
  const ProfileFields({super.key});

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
          child: const Column(
            children: [
              Details(title: "Phone No",iconData: Icons.phone,data: "+91 9265050079"),
              Details(title: "Email ID",iconData: Icons.email,data: "ro@gmail.com"),
              Details(title: "Total Orders",iconData: Icons.shopping_bag_sharp,data: "0"),

            ],
          ),
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String data;

  const Details({super.key, required this.iconData, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(iconData,color: Colors.white,size: 25.h),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(color: Colors.white,fontSize: 18.sp),),
              SizedBox(height: 5.h,),
              Text(data,style: TextStyle(color: Colors.white,fontSize: 13.sp),),
            ],
          )
        ],
      ),
    );
  }
}


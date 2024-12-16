import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors_manager.dart';

class AppStyles{
  static const TextStyle appBar = TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color:ColorsManager.white );
  static const TextStyle drawerTitle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color:ColorsManager.white );

  static const TextStyle categories = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color:ColorsManager.blackAcc );

  static const TextStyle settings = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color:ColorsManager.blackAcc );


  static const TextStyle pickCategory = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color:ColorsManager.grey );

  static const TextStyle categoryTitle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color:ColorsManager.white );
  static TextStyle sourceName = TextStyle(
    color: Color(0xFF79828B),
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle articleTitle = TextStyle(
    color: Color(0xFF42505C),
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle publishedAt = TextStyle(
    color: Color(0xFFA3A3A3),
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle selectedLabel = TextStyle(
      color: ColorsManager.white, fontSize: 14.sp, fontWeight: FontWeight.w400);

  static TextStyle unSelectedLabel = TextStyle(
    color: ColorsManager.green, fontSize: 14.sp, fontWeight: FontWeight.w400,);
  static TextStyle articleDescription= TextStyle(
    color: ColorsManager.articleDetails, fontSize: 22.sp, fontWeight: FontWeight.w700,);
  static TextStyle newsTitle = TextStyle(
  color: ColorsManager.white,
  fontSize: 14.sp,
  fontWeight: FontWeight.w500,
  );
}
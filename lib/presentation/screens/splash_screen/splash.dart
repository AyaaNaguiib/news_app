import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/routes_manager.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2),
          (){
      Navigator.pushReplacementNamed(context, RoutesManager.home);
    },);
  }
 // const ({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
    children: [
      Container(
        color: ColorsManager.white,
          child: Image.asset(AssetsManager.bgPattern,width: double.infinity,height: double.infinity,fit: BoxFit.cover,)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            AssetsManager.logo,
            width: 199.w,
            height: 208.h,),
          const Spacer(),
          Image.asset(
            AssetsManager.routeLogo,
            width: 213.w,
            height: 128.h,),
        ],
      )
    ],
    );
  }
}

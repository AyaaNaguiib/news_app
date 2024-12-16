import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home/home.dart';
import 'package:news_app/presentation/screens/home/tabs/article_details_screen/article_details_screen.dart';
import 'package:news_app/presentation/screens/splash_screen/splash.dart';

class RoutesManager{
  static const String splash = '/splash';
  static const String home = '/home';
  static const String articleDetails ='/article';

 static Route? router(RouteSettings settings){
    switch(settings.name){
      case splash:
        return MaterialPageRoute(builder: (context)=> Splash()
        );
      case home:
        return MaterialPageRoute(builder: (context)=> Home()
        );
      case articleDetails:
        return MaterialPageRoute(
          builder: (context) {
            return ArticleDetailsScreen();
          },
          settings: settings,
        );

    }
  }

}
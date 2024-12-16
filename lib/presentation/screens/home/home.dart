import 'package:flutter/material.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/presentation/screens/home/home_drawer/home_drawer.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/categories.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/categories_details.dart';
import 'package:news_app/presentation/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:news_app/presentation/screens/searchDelegate/searchDelegate.dart';

import '../../../data_model/category_dm.dart';
class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget selectedWidget = Categories(onCategoryClicked: onCategoryClicked) ;
  String appBarTitle = 'News App';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(image: AssetImage(AssetsManager.bgPattern))),
      child: Scaffold(
          appBar: AppBar(
            title:  Text(appBarTitle),
            actions: [
              IconButton(onPressed: (){
                showSearch(context: context, delegate: NewsSearchDelegate());
              },
                  icon: Icon(Icons.search, size: 30,)
              )
            ],
          ),
          drawer: HomeDrawer(
            onMenuItemClicked: onDrawerItemClick,
          ),
          body: selectedWidget),
    );
  }

  void onCategoryClicked(CategoryDM categoryDM){
    selectedWidget = CategoryDetails(categoryDM: categoryDM,);
    appBarTitle = categoryDM.title;
    setState(() {

    });
  }

  void onDrawerItemClick(MenuItem item) {
    Navigator.pop(context);
    if (item == MenuItem.categories) {
      selectedWidget = Categories(onCategoryClicked: onCategoryClicked,);
    } else if (item == MenuItem.settings) {
      selectedWidget = Settings();
    }
    setState(() {});
  }
}


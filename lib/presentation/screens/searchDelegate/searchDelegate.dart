import 'package:flutter/material.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data_api/api_manager/api_manager.dart';
import 'package:news_app/data_api/model/articles_response/article.dart';
import 'package:news_app/data_api/model/articles_response/articles_response.dart';

import '../home/tabs/articles_list_widget/article_item_widget.dart';


class NewsSearchDelegate extends SearchDelegate{
@override
ThemeData appBarTheme(BuildContext context){
  return ThemeData(appBarTheme:  const AppBarTheme(
    backgroundColor: ColorsManager.green,
  ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
    )
  );

}
@override
  List<Widget>?buildActions(BuildContext context){
 return [];
}

@override
  Widget?buildLeading(BuildContext context){
  return IconButton(
      onPressed: (){
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back_ios_new_outlined,
        color: ColorsManager.white,
      )
  );
}

  @override
  Widget buildResults(BuildContext context) {
 return FutureBuilder(future: ApiManager.searchArticles(query),
     builder:(context, snaphot){
       if(snaphot.connectionState == ConnectionState.waiting){
         return const Center(
           child: CircularProgressIndicator(),
         );
       }
       if(snaphot.hasError || snaphot.data == null){
         return Center(
           child: Text('${snaphot.error}'),
         );
       }
       var articlesResponse = snaphot.data as ArticlesResponse;
       if(articlesResponse.articles == null || articlesResponse.articles!.isEmpty  ){
         return const Center(
           child: Text('No result found'),
         );
       }
       return ListView.builder(
         itemBuilder: (context, index)=>
             ArticleItemWidget(article: articlesResponse.articles![index]),
         itemCount: articlesResponse.articles?.length??0,
       );
     });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(future: ApiManager.searchArticles(query),
        builder:(context, snaphot){
      if(snaphot.connectionState == ConnectionState.waiting){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if(snaphot.hasError || snaphot.data == null){
        return Center(
          child: Text('${snaphot.error}'),
        );
      }
      var articlesResponse = snaphot.data as ArticlesResponse;
      if(articlesResponse.articles == null || articlesResponse.articles!.isEmpty  ){
        return const Center(
          child: Text('No result found'),
        );
      }
      return ListView.builder(
          itemBuilder: (context, index)=>
              ArticleItemWidget(article: articlesResponse.articles![index]),
        itemCount: articlesResponse.articles?.length??0,
      );
        });
  }
}
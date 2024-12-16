import 'package:flutter/cupertino.dart';

import '../../../../../data_api/api_manager/api_manager.dart';
import '../../../../../data_api/model/articles_response/article.dart';

class ArticlesViewModel extends ChangeNotifier{
  List<Article>? articles;
  String? errorMessage;
  bool isLoading = false;

  void getNewsBySourceId(String sourceId)async{
    try{
      isLoading = true;
      notifyListeners();
      var response = await ApiManager.getArticles(sourceId);
      isLoading = false;
      if(response.status == 'ok'){
        articles = response.articles;

      }else{
        errorMessage = response.message;

      }
      notifyListeners();
    }catch(e){
      isLoading = false;
      errorMessage = 'Plz, Check internet connection';
      notifyListeners();
    }
  }
}
// import 'package:flutter/material.dart';
//
// import '../../../../../data_api/api_manager/api_manager.dart';
// import '../../../../../data_api/model/articles_response/article.dart';
//
//
// class ArticlesViewModel extends ChangeNotifier {
//   List<Article>? articles;
//
//   String? errorMessage;
//   bool isLoading = false;
//
//   Future<void> getArticlesBySourceId(String sourceId) async {
//     try{
//       isLoading = true;
//       notifyListeners();
//       var response = await ApiManager.getArticles(sourceId);
//       isLoading = false;
//       if(response.status == 'ok'){
//         articles = response.articles;
//       }else{
//         errorMessage = response.message;
//       }
//       notifyListeners();
//     }catch(e){
//       isLoading = false;
//       errorMessage = 'Plz, Check Internet Connection';
//       notifyListeners();
//     }
//   }
// }

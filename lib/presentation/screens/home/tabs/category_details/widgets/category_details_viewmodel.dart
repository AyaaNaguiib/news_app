import 'package:flutter/material.dart';

import '../../../../../../data_api/api_manager/api_manager.dart';
import '../../../../../../data_api/model/sources_responses/source.dart';

class CategoryDetailsViewModel extends ChangeNotifier {

  List<Source>? sources;

  String? errorMessage;
  bool isLoading = false;

  void getSourcesByCategoryId(String categoryId) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await ApiManager.getSources(categoryId);

      isLoading = false;
      if (response.status == 'ok') {
        sources = response.sources;
        notifyListeners();
      } else {
        errorMessage = response.message;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      errorMessage = 'Plz,Check Internet Connection';
      notifyListeners();
    }
  }
}
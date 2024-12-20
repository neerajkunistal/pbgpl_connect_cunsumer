import 'package:flutter/material.dart';

import '../models/get_category_model.dart';

class ProviderMethods with ChangeNotifier {
  GetCategoryModel? getCategoryModel;
  bool loading = false;

  getPostData(context) async {
    loading = true;
    //  getCategoryModel = await apiGetCategory();
    loading = false;
    notifyListeners();
  }
}

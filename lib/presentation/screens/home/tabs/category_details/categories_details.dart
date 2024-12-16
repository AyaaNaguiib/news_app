import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/widgets/category_details_viewmodel.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/widgets/source_tab_widget/source_tab_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../data_model/category_dm.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.categoryDM});

  CategoryDM categoryDM;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryDM.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<CategoryDetailsViewModel>(
          builder: (context, value, child) {
            if (viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (viewModel.errorMessage != null) {
              return Center(
                child: Text(viewModel.errorMessage!),
              );
            }
            return SourcesTabWidget(sources: viewModel.sources!);
          },
        ));
  }
}


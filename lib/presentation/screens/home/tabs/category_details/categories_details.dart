import 'package:flutter/material.dart';

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
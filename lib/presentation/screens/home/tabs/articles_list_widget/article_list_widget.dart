import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../data_api/model/sources_responses/source.dart';
import 'article_item_widget.dart';
import 'article_viewModel.dart';

class ArticlesListWidget extends StatefulWidget {
  ArticlesListWidget({super.key, required this.source});

  Source source;

  @override
  State<ArticlesListWidget> createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends State<ArticlesListWidget> {
  var viewModel = ArticlesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  void didUpdateWidget(covariant ArticlesListWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, value, child) {
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (viewModel.errorMessage != null) {
            return Center(child: Text(viewModel.errorMessage!));
          }

          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  ArticleItemWidget(article: viewModel.articles![index]),
              itemCount: viewModel.articles!.length,
            ),
          );
        },
      ),
    );
  }
}
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:news_app/core/colors_manager.dart';
// import '../../../../../config/theme/app_styles.dart';
// import '../../../../../data_api/api_manager/api_manager.dart';
// import '../../../../../data_api/model/articles_response/article.dart';
// import '../../../../../data_api/model/sources_responses/source.dart';
//
// class ArticlesListWidget extends StatelessWidget {
//   ArticlesListWidget({super.key, required this.source});
//
//   Source source;
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: ApiManager.getArticles(source.id ?? ''),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(color: ColorsManager.green),
//           );
//         }
//         if (snapshot.hasError) {
//           return Text(snapshot.error.toString());
//         }
//         List<Article> articlesList = snapshot.data?.articles ?? [];
//         return Expanded(
//           child: ListView.builder(
//             itemBuilder: (context, index) => InkWell(
//                 onTap: () {},
//                 child: buildArticleItem(article: articlesList[index])),
//             itemCount: articlesList.length,
//           ),
//         );
//       },
//     );
//   }
//
//   Widget buildArticleItem({required Article article}) {
//     return Padding(
//       padding: REdgeInsets.all(12.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(5.r)),
//             child: CachedNetworkImage(
//               imageUrl: article.urlToImage ?? '',
//               placeholder: (context, url) => Center(
//                   child: CircularProgressIndicator(
//                     color: ColorsManager.green,
//                   )),
//               errorWidget: (context, url, error) => Icon(Icons.error),
//             ),
//           ),
//           SizedBox(
//             height: 6.h,
//           ),
//           Text(
//             article.source?.name ?? '',
//             style: AppStyles.sourceName,
//           ),
//           SizedBox(
//             height: 6.h,
//           ),
//           Text(
//             article.title ?? '',
//             style: AppStyles.articleTitle,
//           ),
//           Text(
//             article.publishedAt ?? '',
//             style: AppStyles.publishedAt,
//             textAlign: TextAlign.end,
//           ),
//         ],
//       ),
//     );
//   }
// }

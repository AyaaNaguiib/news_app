import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../config/theme/app_styles.dart';
import '../../../../../data_api/model/articles_response/article.dart';

class ArticleDetailsScreen extends StatelessWidget {

   ArticleDetailsScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)!.settings.arguments as Article;
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(
          image: AssetImage(AssetsManager.bgPattern),
          fit: BoxFit.cover,
          opacity: 0.7,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            article.title ?? 'News Article',
            style: AppStyles.newsTitle,
          ),
          backgroundColor: ColorsManager.green,
        ),
        body: Padding(
          padding: REdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  article.urlToImage ?? '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.h,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 200),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                article.source?.name ?? '',
                style: AppStyles.sourceName,
              ),
              SizedBox(height: 8.h),
              // Title
              Text(
                article.title ?? '',
                style: AppStyles.articleTitle,
              ),
              SizedBox(height: 16.h),
              // Description
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    article.description ?? 'No description available',
                    style: AppStyles.articleDescription,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  article.publishedAt ?? '',
                  style: AppStyles.publishedAt,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  _launchInBrowserView(Uri.parse(article.url ?? ""));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('view full article'),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
   Future<void> _launchInBrowserView(Uri url) async {
     if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
       throw Exception('Could not launch $url');
     }
   }
}




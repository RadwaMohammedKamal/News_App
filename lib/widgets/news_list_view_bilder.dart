import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../services/news_service.dart';
import 'news_list_view.dart';


class NewsListViewBilder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: NewsService(Dio()).getNews(),
        builder: (context, snapshot) => NewsListView(articles:snapshot.data ??[],));
  }
}
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import '../models/article_modlel.dart';
// import '../services/news_service.dart';
// import 'news_list_view.dart';
//
// class NewsListViewBilder extends StatefulWidget {
//   const NewsListViewBilder({super.key,});
//
//   @override
//   State<NewsListViewBilder> createState() => _NewsListViewBilderState();
// }
//
// class _NewsListViewBilderState extends State<NewsListViewBilder> {
//   List<ArticleModel>articles=[];
//   bool isLoading=true;
//   @override
//   void initState()  {
//     super.initState();
//     getGeneralNews();
//   }
//
//   Future<void> getGeneralNews() async {
//     articles=await NewsService(Dio()).getNews();
//     isLoading=false;
//     setState(() {
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return isLoading? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
//         : articles.isNotEmpty? NewsListView(articles:articles,)
//         :SliverToBoxAdapter(child: Center(child: Text("errorrrr",style: TextStyle(fontSize: 50),)),);
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/article_modlel.dart';
import '../services/news_service.dart';
import 'news_tile.dart';


class NewsListView extends StatelessWidget {
  final List<ArticleModel>articles;
  const NewsListView({super.key, required this.articles});
  @override
  Widget build(BuildContext context) {
    return  SliverList(
        delegate: SliverChildBuilderDelegate(  //solve problem of  expand which make the screen build sloly instead of using listview.builder becoust listview make sys slow
        childCount: articles.length,
            (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsTile(articleModel: articles[index]),
          );
        }));



  }
}

// ListView.builder(
// physics: BouncingScrollPhysics(),
//   itemCount: 10,
//   itemBuilder: (context,indix){
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 22),
//       child: NewsTile(),
//     ) ;
//   }) ;

// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../models/article_modlel.dart';
// import '../services/news_service.dart';
// import 'news_tile.dart';
//
// class NewsListView extends StatefulWidget{
//   const NewsListView({super.key});
//   @override
//   State<NewsListView> createState() => _NewsListViewState();
// }
//
// class _NewsListViewState extends State<NewsListView> {
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
//     return isLoading? SliverToBoxAdapter(
//         child: Center(child: CircularProgressIndicator())): SliverList(
//         delegate: SliverChildBuilderDelegate(  //solve problem of  expand which make the screen build sloly instead of using listview.builder becoust listview make sys slow
//             childCount: articles.length,
//                 (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(bottom: 22),
//                 child: NewsTile(articleModel: articles[index]),
//               );
//             }));
//
//
//
//   }
// }

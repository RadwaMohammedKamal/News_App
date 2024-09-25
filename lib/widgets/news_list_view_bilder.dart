import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/article_modlel.dart';
import '../services/news_service.dart';
import 'news_list_view.dart';


class NewsListViewBilder extends StatefulWidget {

final String category;

  const NewsListViewBilder({super.key, required this.category});
  @override
  State<NewsListViewBilder> createState() => _NewsListViewBilderState();
}

class _NewsListViewBilderState extends State<NewsListViewBilder> {
  @override
  var future;
  void initState() {
    // TODO: implement initState
    super.initState();
    future=NewsService(Dio()).getTopHeadlines(category: widget.category);
  }
  Widget build(BuildContext context) {
    return  FutureBuilder<List<ArticleModel>>(
        future:future ,
        builder: (context, snapshot){
         if(snapshot.hasData){
        return  NewsListView(
          articles:snapshot.data !,);
         }else if(snapshot.hasError){
           return SliverToBoxAdapter(
             child: Center(child: Text("errorrrr",style: TextStyle(fontSize: 50),)),);
         }  else{
           return SliverToBoxAdapter(
               child: Center(
                   child: CircularProgressIndicator()));
         }
        }
    );
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
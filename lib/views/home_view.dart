import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/category_list_view.dart';
import '../widgets/news_list_view_bilder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:const Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("News "),
               Text(" Cloud",style: TextStyle(color: Colors.orange),)
            ],
          ),

      ),
      body:Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView( //make all screen to be scrolled
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryListView(),), //take a group of widget to be scroll
            SliverToBoxAdapter(child: SizedBox(
              height: 32,
            ),),
            NewsListViewBilder(category: "general"),
          ],
        )
        // Column(
        //   children: [
        //     CategoryListView(),
        //     SizedBox(
        //       height: 32,
        //     ),
        //     Expanded(child: NewsListView()),
        //   ],
        // ),
      )

     

    );
  }
}


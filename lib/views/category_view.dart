import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_bilder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: CustomScrollView(
  slivers: [
    NewsListViewBilder(category: category,)
  ],
),
    );
  }
}
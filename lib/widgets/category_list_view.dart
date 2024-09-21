import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_card.dart';

class CategoryListView extends StatelessWidget{
  const CategoryListView({super.key,});

  final List<CategoryModel> categores=const[
    CategoryModel(image: 'assets/images/technology.jpeg',name: 'sports'),
    CategoryModel(image: 'assets/images/technology.jpeg',name: 'bussiness'),
    CategoryModel(image: 'assets/images/technology.jpeg',name: 'entertainment'),
    CategoryModel(image: 'assets/images/technology.jpeg',name: 'health'),
    CategoryModel(image: 'assets/images/technology.jpeg',name: 'science'),
    CategoryModel(image: 'assets/images/technology.jpeg',name: 'technology'),
  ];
  @override

  Widget build(BuildContext context) {
   return SizedBox(
     height: 100,
     child: ListView.builder(
       physics: BouncingScrollPhysics(),
       scrollDirection: Axis.horizontal,
       itemCount: categores.length,
       itemBuilder: (context,index){
         return CategoryCard( category: categores[index],);
       },
     ),
   );
  }
}


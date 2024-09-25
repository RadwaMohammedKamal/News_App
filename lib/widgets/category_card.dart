import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget{
 const  CategoryCard({super.key,required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context){
          return CategoryView(category: category.name,);
        }
        )
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(category.image),
            ) ,
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child:  Text(category.name,style: TextStyle(
              color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold
          ),)),
        ),
      ),
    );
  }


}
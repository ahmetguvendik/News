
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/components/custom_show_details.dart';
import 'package:news/models/article_model.dart';

Widget CustomShow(Article article,BuildContext context){
  return Card(
    child: ListTile(
      title: Text(article.title),
      trailing: IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomShowDetails(article: article)));
      }, icon: Icon(Icons.navigate_next_outlined)),
      leading: Image.network(article.urlToImage)),

    );

}
import 'dart:convert';

import 'package:http/http.dart';
import 'package:news/models/article_model.dart';

class ApiServices{
  Uri api = Uri.parse("https://newsapi.org/v2/top-headlines?country=tr&apiKey=API_KEY");

  Future<List<Article>> getArticle() async{
    Response res = await get(api);
    if(res.statusCode==200){
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json["articles"];
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList(); //yeni haberleri göstermek için.
      return articles;
    }
    else{
      throw ("Wrong");
    }
  }
}
import 'package:flutter/material.dart';
import 'package:news/components/custom_show.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }

}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Haberler",style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.blue,fontSize: 20)),
      ),
      body: FutureBuilder(
        future: apiServices.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasData){
            List<Article> article = snapshot.data;
            return ListView.builder(
                itemCount:  article.length,
                itemBuilder: (context,index) => CustomShow(article[index],context));
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
          },
      ),
    );
  }
}

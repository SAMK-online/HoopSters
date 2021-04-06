import 'package:flutter_hoop_talk/model/article_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class News {
  List<ArticleModel> news = [];
  
  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/everything?q=tesla&from=2021-03-05&sortBy=publishedAt&apiKey=1421cd25a64c4c609b720207a64889a3";
    
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

     if(jsonData['status']==['ok']){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModel);
        }
      });
    }

  }

}
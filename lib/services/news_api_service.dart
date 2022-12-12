import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wmt_news_app/features/articles/data/model/article_model.dart';

///This class will be responsible for handling api requests to newsapi.org
class NewsApiService{
  final _baseUrl = "https://newsapi.org/v2/";
  final _apiKey = "c08a013c69af4bcfa3c1566defd0cd4e";

  ///fetch article and return to this app
  Future<List<Article>> getAllArticles() async {
    var endpoint = "top-headlines?country=ng&apiKey=$_apiKey";
    var fullUrl = _baseUrl+endpoint;

    //create empty list to be returned
    var listToBeReturned = <Article>[];

    //make network request
    http.Response response = await http.get(Uri.parse(fullUrl));

    //jsonDecode Converts the response body which comes as a string into a map object
    Map<String, dynamic> responseBody = jsonDecode(response.body);

    //filter through the map and get articles list
    var listOfArticles = responseBody["articles"];

    //loop through the list and convert the map to Article object
    for(Map<String, dynamic> articleItem in listOfArticles){
      //Creates an article object
      var article = Article.fromJson(articleItem);
      listToBeReturned.add(article);
    }

    return listToBeReturned;
  }


}
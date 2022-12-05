
import 'package:wmt_news_app/services/news_api_service.dart';

import '../model/article_model.dart';

class ArticleRepository{
  var _apiService = NewsApiService();

  Future<List<Article>> getAllArticles() async{
    return _apiService.getAllArticles();
  }
}
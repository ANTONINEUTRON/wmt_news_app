import '../../data/model/article_model.dart';
import '../../data/repository/article_repository.dart';

class ArticleState{

  List<Article> listOfArticles;

  ArticleState({this.listOfArticles  = const []});

  Future<List<Article>> getArticles() async {
    var repo = ArticleRepository();

    return await repo.getAllArticles();
  }

}
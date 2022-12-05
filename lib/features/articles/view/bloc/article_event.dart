import 'package:equatable/equatable.dart';

import '../../data/model/article_model.dart';

abstract class ArticleEvent{}

class LoadArticle extends ArticleEvent{
}

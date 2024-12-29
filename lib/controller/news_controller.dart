import 'package:flutter/material.dart';
import 'package:newsapp/model/news_list_model.dart';
import 'package:newsapp/service/new_Service.dart';

class NewsProvider with ChangeNotifier {
  final NewsService _newsService = NewsService();
  List<NewsArticle> _articles = [];
  bool _isLoading = false;
  List<NewsArticle> _bookmarkedArticles = []; 

  List<NewsArticle> get articles => _articles;
   List<NewsArticle> get bookmarkedArticles => _bookmarkedArticles; 
  bool get isLoading => _isLoading;

  // Fetch news
  Future<void> fetchTopHeadlines() async {
    _isLoading = true;
    notifyListeners();

    try {
      final fetchedArticles = await _newsService.fetchTopHeadlines();
      _articles = fetchedArticles
          .map((article) => NewsArticle.fromJson(article))
          .toList();
    } catch (e) {
      print('Error fetching news: $e');
      _articles = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  // Search 
  Future<void> searchNews(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      final fetchedArticles = await _newsService.searchNews(query);
      _articles = fetchedArticles
          .map((article) => NewsArticle.fromJson(article)) // Map the result to NewsArticle
          .toList();
    } catch (e) {
      print('Error searching news: $e');
      _articles = [];
    }

    _isLoading = false;
    notifyListeners();
  }
  Future<void> fetchNewsByCategory(String category) async {
    _isLoading = true;
    notifyListeners();

    try {
      final fetchedArticles = await _newsService.fetchNewsByCategory(category);
      _articles = fetchedArticles
          .map((article) => NewsArticle.fromJson(article))
          .toList();
    } catch (e) {
      print('Error fetching category news: $e');
      _articles = [];
    }

    _isLoading = false;
    notifyListeners();
  }
 void toggleBookmark(NewsArticle article) {
    if (_bookmarkedArticles.contains(article)) {
      _bookmarkedArticles.remove(article);
    } else {
      _bookmarkedArticles.add(article);
    }
    notifyListeners();
  }
    void removeBookmark(NewsArticle article) {
    _bookmarkedArticles.remove(article);
    notifyListeners();
  }
}

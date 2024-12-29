import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/news_source.dart';

class NewsService {
  final String _baseUrl = 'https://newsapi.org/v2';
  final String _apiKey = 'fc86166cca054334bf29bd23ad8b3bd6'; 

  Future<List<dynamic>> fetchTopHeadlines() async {
    final url = '$_baseUrl/top-headlines?country=us&apiKey=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['articles'] as List<dynamic>;
    } else {
      throw Exception('Failed to load news');
    }
  }

 // Search 
  Future<List<dynamic>> searchNews(String query) async {
    final url = '$_baseUrl/everything?q=$query&apiKey=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['articles'] as List<dynamic>;
    } else {
      throw Exception('Failed to search news');
    }
  }


// Fetch news by category
  Future<List<dynamic>> fetchNewsByCategory(String category) async {
    final url =
        '$_baseUrl/top-headlines?category=$category&apiKey=$_apiKey&country=us';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['articles'] as List<dynamic>;
    } else {
      throw Exception('Failed to load category news');
    }
  }
}
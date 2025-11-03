import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobilka_news_api/domain/entity/news.dart';

class ApiService {
  Future<List<News>> onClicked(String category) async{
      final url = category.isEmpty 
      ? 'https://newsapi.org/v2/top-headlines?country=us&apiKey=bc80b806dc4b4ae683648001ac63eee6'
      : 'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=bc80b806dc4b4ae683648001ac63eee6';
      final uri = Uri.parse(url);
      final response =  await http.get(uri).timeout(const Duration(seconds: 2)); 

      final body = response.body;
      final json = jsonDecode(body);
    
      final result = json['articles'] as List<dynamic>;
      final transform = result.map((e) {
        return News.fromMap(e);
      }).toList();

      return transform;
  }
}
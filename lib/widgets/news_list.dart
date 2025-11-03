import 'package:flutter/material.dart';
import 'package:mobilka_news_api/domain/entity/news.dart';
import 'package:mobilka_news_api/domain/services/api_service.dart';
  import 'package:mobilka_news_api/widgets/news_tab.dart';

class NewsList extends StatefulWidget {
  final String category;

  const NewsList({super.key, required this.category});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<News> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    initialNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading){
      return const Center(child: CircularProgressIndicator());
    }

    if(articles.isEmpty){
          return const Center(child: Text('NO NEWS'));
        }

    return  ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return NewsTab(
            category: widget.category, 
            author: article.author, 
            urlToImage: article.urlToImage, 
            title: article.title, 
            publishedAt: article.publishedAt,
            content: article.content,
        );
      },
    );
  }

  Future<void> initialNews() async {
  try {
    final apiService = ApiService();
    final apiNews = await apiService.onClicked(widget.category);

    if (!mounted) return; 
    setState(() {
      articles = apiNews;
      isLoading = false;
    });
  } catch (e) {
    if (!mounted) return; 
    setState(() {
      isLoading = false;
    });
  }
}
}
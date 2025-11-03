import 'package:flutter/material.dart';
import 'package:mobilka_news_api/widgets/calculate_time.dart';
import 'package:mobilka_news_api/widgets/image_returner.dart';

class ArticleDetailPage extends StatefulWidget {
  final String category;
  final String author;
  final String urlToImage;
  final String title;
  final String publishedAt;
  final String content;


  const ArticleDetailPage({
    super.key,
    required this.author,
    required this.category,
    required this.publishedAt,
    required this.title,
    required this.urlToImage,
    required this.content
    });

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },  
          icon: Icon(Icons.arrow_back, color: Colors.black)
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share_rounded, color: Colors.black)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded, color: Colors.black)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.author, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(CalculateTime.calculateTime(widget.publishedAt), style: TextStyle(fontSize: 14, color: Color(0xFF4E4B66))),

            const SizedBox(height: 15),

            ImageRetuner(urlToImage: widget.urlToImage, width: 465, height: 305),

            const SizedBox(height: 5),

            Text(widget.category.toUpperCase(), style: TextStyle(color: Color(0xFF4E4B66), fontSize: 14)),

            const SizedBox(height: 5),

            Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),

            const SizedBox(height: 20),

            Text(widget.content, style: TextStyle(color: Color(0xFF4E4B66), fontSize: 16),)          
          ],
        ),
      ),
    );
  }
}
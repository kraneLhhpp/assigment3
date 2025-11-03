class News {
  final String author;
  final String title;
  final Source source;
  final String urlToImage;
  final String publishedAt;
  final String content;

  News({required this.author, required this.title, required this.source, required this.urlToImage, required this.publishedAt, required this.content});

  factory News.fromMap(Map<String, dynamic> map){
    final source = Source( 
          id: map['source']['id'] ?? 'no id', 
          name: map['source']['name'] ?? 'no name'
        );

    return News(
      author: map['author'] ?? 'no author' , 
      title: map['title'] ?? 'no title', 
      source: source, 
      urlToImage: map['urlToImage'] 
      ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg', 
      publishedAt: map['publishedAt'] ?? 'no info',
      content: map['content'] ?? 'no content',  
    );  
  }
}

class Source{
  final String id;
  final String name;

  Source({required this.id, required this.name});
}
class News  {
  final Source source;
    final String author;
    final String title;
    final String description;
    final String url;
    final String urlToImage;
    final DateTime publishedAt;
    final String content;

  News({required this.source, required this.author, required this.title, required this.description, required this.url, required this.urlToImage, required this.publishedAt, required this.content});
}

class Source {
    final String id;
    final String name;

    Source({
        required this.id,
        required this.name,
    });

   
}
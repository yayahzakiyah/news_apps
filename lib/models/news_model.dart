class NewsModel {
  final Map<String, dynamic>? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? img;
  final String? time;
  final String? content;

  NewsModel(
      {this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.img,
      required this.time,
      required this.content});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        source: json['source'],
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        img: json['urlToImage'],
        time: json['publishedAt'],
        content: json['content']);
  }
}

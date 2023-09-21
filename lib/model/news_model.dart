class NewsModel {
  final String? url;
  final String? image;
  final String title;
  final String? subtitle;

  NewsModel(
      {required this.url,
      required this.image,
      required this.title,
      required this.subtitle});

  factory NewsModel.fromJson(json) {
    return NewsModel(
      url: json['url'],
      image: json['urlToImage'],
      title: json['title'],
      subtitle: json['description'],
    );
  }
}

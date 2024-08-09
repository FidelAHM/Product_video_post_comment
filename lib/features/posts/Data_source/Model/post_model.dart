class PostModel {
  final int id;
  final String title;
  final String body;
  final int likes;
  final int dislikes;
  final int views;
  PostModel({
    required this.body,
    required this.dislikes,
    required this.likes,
    required this.id,
    required this.title,
    required this.views,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      body: json['body']?? 'No body',
      title: json['title'] ?? 'no title',
      dislikes: json['reactions']['dislikes'] ?? 0,
      likes: json['reactions']['likes'] ?? 0,
      id: json['id'] ??'no id',
      views: json['views'] ?? 0
    );
  }
}

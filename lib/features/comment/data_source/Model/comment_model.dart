class CommentModel {
  final int id;
  final int postId;
  final int likes;
  final String body;
  final String username;
  final String fullName;
  CommentModel(
      {required this.id,
      required this.body,
      required this.likes,
      required this.postId,
      required this.fullName,
      required this.username});
  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
        id: json['id'] ?? 0,
        likes: json['likes'] ?? 0,
        body: json['body'] ?? "no body",
        postId: json['postId'] ?? 0,
        username: json['user']['username'] ?? "no name",
        fullName: json['user']['fullName'] ?? "no name"
        );
  }
}

class VideoPlayerModel {
  final String id;
  final String title;
  final String videoUrl;
  final String createdAt;
  VideoPlayerModel(
      {
        required this.id,
         required this.title, 
         required this.videoUrl,
         required this.createdAt
         });

  factory VideoPlayerModel.fromJson(Map<String, dynamic> json) {
    return VideoPlayerModel(
        title: json['title'] ?? "no title",
        id: json['_id'] ?? "no id",
        videoUrl: json['videoUrl'] ?? "no video",
        createdAt: json['createdAt'] ?? "no created at"
        );
  }
}

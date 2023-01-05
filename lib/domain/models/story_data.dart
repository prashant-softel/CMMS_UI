class StoryData {
  StoryData({
    this.type,
    this.url,
    this.seqId,
    this.thumbnail,
  });

  factory StoryData.fromJson(Map<String, dynamic> json) => StoryData(
        type: json['type'] as int? ?? 0,
        url: json['url'] as String? ?? '',
        seqId: json['seqId'] as int? ?? 0,
        thumbnail: json['thumbnail'] as String? ?? '',
      );

  int? type;
  String? url;
  int? seqId;
  String? thumbnail;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'url': url,
        'seqId': seqId,
        'thumbnail': thumbnail,
      };
}

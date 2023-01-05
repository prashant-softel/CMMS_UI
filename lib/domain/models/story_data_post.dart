class StoryDataPost {
  StoryDataPost({required this.type, required this.seqId, required this.url});
  final int type;
  final int seqId;
  final String url;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'seqId': seqId,
        'type': type,
        'url': url,
      };
}

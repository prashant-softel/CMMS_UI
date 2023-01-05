// coverage:ignore-file
/// Reels data model
class TrendingReel {
  TrendingReel(
      this.id, this.video, this.isLiked, this.totalLikes, this.isListed);
  final String id;
  final String video;
  bool isLiked;
  final String totalLikes;
  bool isListed;
}

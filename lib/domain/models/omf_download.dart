// coverage:ignore:file

class OmfDownload {
  OmfDownload({
    this.id,
    this.movie,
    this.movieName,
    this.movieThumbnail,
    this.movieSize,
    this.receivedBytes,
    this.totalBytes,
    this.isExpired = false,
    this.isDownloading = false,
    this.pauseDownloading = false,
  });

  String? id;
  String? movie;
  String? movieName;
  String? movieThumbnail;
  String? movieSize;
  int? receivedBytes;
  int? totalBytes;
  bool? pauseDownloading;
  bool? isExpired;
  bool? isDownloading;
}

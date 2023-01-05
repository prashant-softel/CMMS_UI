enum MovieCategoryType {
  movie,
  omfseries,
  continues,
  topTen,
}

class MoviesCategory {
  MoviesCategory({this.id, this.categoryName, this.movieCategoryType, this.subCategory});
  int? id;
  String? categoryName;
  MovieCategoryType? movieCategoryType;
  List<MoviesSubCategory>? subCategory;
}

class MoviesSubCategory {
  MoviesSubCategory(
      {this.id,
      this.videoName,
      this.videoUrl,
      this.startIndex,
      this.endIndex,
      required this.indices});
  int? id;
  String? videoName;
  String? videoUrl;
  int? startIndex;
  int? endIndex;
  List<int> indices;
}

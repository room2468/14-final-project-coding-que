class Movie {
  int id;
  String backdropPath;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;

  Movie(
    this.id,
    this.backdropPath,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage
  );

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.backdropPath = parsedJson['backdrop_path'];
    this.overview = parsedJson['overview'];
    this.popularity = parsedJson['popularity'];
    this.posterPath = parsedJson['poster_path'];
    this.releaseDate = parsedJson['release_date'];
    this.title = parsedJson['title'];
    this.video = parsedJson['video'];
    this.voteAverage = parsedJson['vote_average'] * 1.0; 
  }
}
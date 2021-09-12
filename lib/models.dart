
class Movie{
  String? title,overview,posterUrl,releaseDate,language;
  num? popularity,voteAverage;
  num? voteCount;
  Movie({
    required this.title,
    required this.overview,
    required this.posterUrl,
    required this.releaseDate,
    required this.language,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount
});
  factory Movie.fromJson(Map<String,dynamic> json){
    return Movie(
        title: json['title'],
        overview: json['overview'],
        posterUrl: json['poster_path'],
        releaseDate: json['release_date'],
        language: json['original_language'],
       popularity: json['popularity'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count']
    );
  }
}

List<Movie> favouriteMovies = [];
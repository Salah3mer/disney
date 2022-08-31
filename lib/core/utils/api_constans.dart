class ApiConstans{

  static const String  baseUrl ='https://api.themoviedb.org/3';
  static const String  apiKey ='7ce7a2cb8fd00337ce2e3019c0d2e60b';

  static const String nowPlayingMovieUrl='$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMovieUrl='$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMovieUrl='$baseUrl/movie/top_rated?api_key=$apiKey';

  static const String imagePath='https://image.tmdb.org/t/p/w500';

  static String image(String image)=>'$imagePath$image';
}
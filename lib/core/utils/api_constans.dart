class ApiConstans{

  static const String  baseUrl ='https://api.themoviedb.org/3';
  static const String  apiKey ='7ce7a2cb8fd00337ce2e3019c0d2e60b';

  static  String nowPlayingMovieUrl (int page)=>'$baseUrl/movie/now_playing?api_key=$apiKey&page=$page';
  static  String popularMovieUrl (int page)=>'$baseUrl/movie/popular?api_key=$apiKey&page=$page';
  static  String topRatedMovieUrl(int page)=>'$baseUrl/movie/top_rated?api_key=$apiKey&page=$page';
  static const String genresMovie='$baseUrl/genre/movie/list?api_key=$apiKey&language=en-US';
  static  String movieDetails(int movieId)=>'$baseUrl/movie/$movieId?api_key=$apiKey&append_to_response=images';
  static  String movieCast(int movieId)=>'$baseUrl/movie/$movieId/credits?api_key=$apiKey&append_to_response=images';
  static  String movieSearch(String name)=>'$baseUrl/search/movie?api_key=$apiKey&language=en-US&query=$name';
  static  String similerMovies(int movieId)=>'$baseUrl/movie/$movieId/similar?api_key=$apiKey&append_to_response=images';

  static const String imagePath='https://image.tmdb.org/t/p/w500';

  static String image(String image)=>'$imagePath$image';
}
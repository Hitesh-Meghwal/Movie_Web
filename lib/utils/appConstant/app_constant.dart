class AppConstant {
  static const BASE_URL = "https://api.themoviedb.org/3/movie";
  static const HEADERS = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZTk5ODg3MTkxNDY2YmRjMGUwY2Y2MTNlMzI5MGNiYyIsIm5iZiI6MTczNDk3MzUzMS41MzUsInN1YiI6IjY3Njk5ODViNjE3OGZjYmJlYWM0ZjgyYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.n9WknC1DyCqPpBzGT2qljaoXN3FL8aM0nysmlczzcjs',
    'accept': 'application/json'
  };

  static const imagePath = "https://image.tmdb.org/t/p/w500/";

  //endpoints
  static const movieNowPlayingList =
      "$BASE_URL/now_playing?language=en-US&page=1";
  static const topRatedPlayingList =
      "$BASE_URL/top_rated?language=en-US&page=1";
}

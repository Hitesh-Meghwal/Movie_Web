class AppConstant {
  static const BASE_URL = "https://api.themoviedb.org/3/movie";
  static const HEADERS = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZTk5ODg3MTkxNDY2YmRjMGUwY2Y2MTNlMzI5MGNiYyIsIm5iZiI6MTczNDk3MzUzMS41MzUsInN1YiI6IjY3Njk5ODViNjE3OGZjYmJlYWM0ZjgyYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.n9WknC1DyCqPpBzGT2qljaoXN3FL8aM0nysmlczzcjs',
    'accept': 'application/json'
  };

  //endpoints
  static const movieNowPlayingList =
      "$BASE_URL/now_playing?language=en-US&page=1";
}

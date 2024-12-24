class ApiReponse {
  final int pages;
  final dynamic results;

  ApiReponse({required this.pages, required this.results});

  factory ApiReponse.fromJson(Map<String, dynamic> json) {
    return ApiReponse(pages: json['page'], results: json['results']);
  }
}

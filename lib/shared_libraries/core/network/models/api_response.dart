class ApiResponse<T> {
  ApiResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    required this.onDeserialized,
  });

  int? page;
  T? results;
  int? totalPages;
  int? totalResults;
  late T Function(dynamic) onDeserialized;

  ApiResponse.fromJson(
    Map<String, dynamic> json, {
    required T Function(dynamic) onDataDeserialized,
  }) {
    onDeserialized = onDataDeserialized;
    page = json['page'];
    results = json['results'] != null ? onDeserialized(json['results']) : null;
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

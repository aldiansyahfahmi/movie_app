class ApiResponseEntity<T> {
  ApiResponseEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  T results;
  int totalPages;
  int totalResults;
}

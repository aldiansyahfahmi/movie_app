class ApiResponse<T> {
  ApiResponse({
    this.page,
    this.results,
    required this.onDeserialized,
  });

  int? page;
  T? results;
  late T Function(dynamic) onDeserialized;

  ApiResponse.fromJson(
    Map<String, dynamic> json, {
    required T Function(dynamic) onDataDeserialized,
  }) {
    onDeserialized = onDataDeserialized;
    page = json['page'];
    results = json['results'] != null ? onDeserialized(json['results']) : null;
  }
}

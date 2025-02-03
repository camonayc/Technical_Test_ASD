class SearchMoviesParams {
  SearchMoviesParams({
    this.page = 1,
    required this.query,
  });

  final int page;
  final String query;
}

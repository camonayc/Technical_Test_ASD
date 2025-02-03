class GetMoviesParams {
  GetMoviesParams({
    this.page = 1,
    this.sortBy = 'popularity.desc',
  });

  final int page;
  final String sortBy;
}

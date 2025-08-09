class QuranCollectionModel {
  String name;
  List<int> pages;
  List<int> completedPages;

  QuranCollectionModel({
    required this.name,
    this.pages = const [],
    this.completedPages = const [],
  });

  int get totalPages => pages.length;
  int get studiedPages => completedPages.length;
  double get completionPercent =>
      totalPages == 0 ? 0 : studiedPages / totalPages;
}

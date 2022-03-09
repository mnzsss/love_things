import '../../modules/home/home_page.dart';

class NavigationController {
  var currentPageIndex = 0;
  var pages = [
    HomePage(),
  ];

  get currentPage => pages[currentPageIndex];

  void setPage(int pageIndex) {
    currentPageIndex = pageIndex;
  }
}

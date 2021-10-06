class Filter {
  bool filterState;
  final String title;
  final String subTitle;

  Filter({this.filterState = false, required this.title, required this.subTitle});
}

enum mealFilters { gluten, lactose, vegan, vegetarian }

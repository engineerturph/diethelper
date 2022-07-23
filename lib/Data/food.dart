class Food {
  Food({required this.name, required this.kcalList, required this.typeList});
  final String name;
  bool isAdded = false;
  final List<int> kcalList;
  final List<String> typeList;
}

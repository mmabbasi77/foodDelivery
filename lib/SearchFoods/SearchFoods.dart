class SearchingFood {
  List<String> foods = ["burger", "pizza", "salan", "drink", "biryani"];

  List<String> searchFood(String query) {
    if (query.isEmpty) {
      return [];
    } else {
      return foods
          .where((food) => food.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

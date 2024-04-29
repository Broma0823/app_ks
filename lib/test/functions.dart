class BorrowReturnFunction {
  List<String> borrowedItems = [];

  void borrowItem(String itemNumber) {
    borrowedItems.add(itemNumber);
  }

  void returnItem(String itemNumber) {
    borrowedItems.remove(itemNumber);
  }
}

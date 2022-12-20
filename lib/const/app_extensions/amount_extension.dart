extension Amount on String {
  String priceString() {
    final numberString = toString();
    final numberDigits = List.from(numberString.split(''));
    int index = numberDigits.length - 3;
    while (index > 0) {
      numberDigits.insert(index, ',');
      index -= 3;
    }

    return numberDigits.join() + ".00";
  }
}

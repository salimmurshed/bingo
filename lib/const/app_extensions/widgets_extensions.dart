extension UpperCamelCase on String {
  String toUpperCamelCase() {
    return capitalize(this).replaceAll(" ", "");
  }
}

extension LowerCamelCase on String {
  String toLowerCamelCase() {
    String uppercaseText = this.toLowerCase().toUpperCamelCase();
    return uppercaseText[0].toLowerCase() + uppercaseText.substring(1);
  }
}

String capitalize(String value) {
  if (value.isEmpty) {
    return "";
  }
  return value.split(' ').map(capitalizeFirst).join(' ');
}

String capitalizeFirst(String s) {
  return s[0].toUpperCase() + s.substring(1).toLowerCase();
}

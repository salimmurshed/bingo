extension ListToString on String {
  String get listToString =>
      replaceAll("[", "").replaceAll("]", "").replaceAll(" ", "").toString();
}
/*
extension ListToInt on String {
  int get listToInt => replaceAll("[", "").replaceAll("]", "");
}*/

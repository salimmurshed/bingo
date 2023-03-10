import '../../data_models/construction_model/static_data_models/visit_frequent_list_model.dart';

class AppList {
  AppList._();
  static List<VisitFrequentListModel> visitFrequentlyList = [
    VisitFrequentListModel(id: 0, title: "Select one"),
    VisitFrequentListModel(id: 1, title: "Twice a week"),
    VisitFrequentListModel(id: 2, title: "Weekly"),
    VisitFrequentListModel(id: 3, title: "Every two weeks"),
    VisitFrequentListModel(id: 4, title: "Every Three Weeks"),
    VisitFrequentListModel(id: 5, title: "Monthly"),
  ];

  static String checkVisiteFrequency(int i) {
    if (i == 1) {
      return "Twice a week";
    } else if (i == 2) {
      return "Weekly";
    } else if (i == 3) {
      return "Every two weeks";
    } else if (i == 4) {
      return "Every Three Weeks";
    } else {
      return "Monthly";
    }
  }
}

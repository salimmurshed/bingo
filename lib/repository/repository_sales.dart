import 'package:injectable/injectable.dart';
import '../../../app/locator.dart';
import 'package:stacked/stacked.dart';

import '../services/local_data/local_data.dart';
import '../services/local_data/table_names.dart';

@lazySingleton
class RepositorySales with ReactiveServiceMixin {
  final LocalData _localData = locator<LocalData>();
  RepositorySales() {
    listenToReactiveValues([]);
  }

  void addSales(Map<String, String?> body) {
    _localData.insert(TableNames.wholesalerCreditlineRequestList, body);
  }
}

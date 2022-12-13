part of '../../ui/add_credit_line_screen/add_credit_line_view.dart';class MultipleSearchSelectionPart extends StatelessWidget {  MultipleSearchSelectionPart(this.model, {Key? key}) : super(key: key);  AddCreditLineViewModel model;  @override  Widget build(BuildContext context) {    return MultipleSearchSelection<FieCreditLineRequestData>(      items: model.allFieCreditLine, // List<Country>      fieldToCheck: (c) {        return c.bpName!; // String      },      itemBuilder: (item) {        return Padding(          padding: const EdgeInsets.all(6.0),          child: Container(            decoration: BoxDecoration(              borderRadius: BorderRadius.circular(6),              color: Colors.white,            ),            child: Padding(              padding: const EdgeInsets.symmetric(                vertical: 20.0,                horizontal: 12,              ),              child: Text(item.bpName!),            ),          ),        );      },      pickedItemBuilder: (item) {        return Container(          decoration: BoxDecoration(            color: Colors.white,            border: Border.all(color: Colors.grey[400]!),          ),          child: Padding(            padding: const EdgeInsets.all(8),            child: Text(item.bpName!),          ),        );      },      sortShowedItems: true,      sortPickedItems: true,      fuzzySearch: FuzzySearch.jaro,      itemsVisibility: ShowedItemsVisibility.alwaysOn,      title: Padding(        padding: const EdgeInsets.only(top: 12.0),        child: Text(          "Select Financial Institution With Whom "          "You Are Working",        ),      ),      showSelectAllButton: true,      maximumShowItemsHeight: 200,    );  }}
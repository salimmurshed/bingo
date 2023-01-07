part of '../../ui/static_screen/static_screen_view.dart';

class SalesTab extends StatelessWidget {
  SalesTab(this.model, {Key? key}) : super(key: key);
  StaticViewModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0.hp,
      width: 100.0.wp,
      child: Column(
        children: [
          SizedBox(
            height: 100.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(AppString.sortBy),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      width: 100.0,
                      height: 30.0,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Center(child: Text('Tax ID')),
                          onChanged: (a) {},
                          items: ['Tax ID', 'Tax ID']
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: model.isBusy
                ? const Center(
                    child: SizedBox(
                        width: 10.0,
                        height: 10.0,
                        child: CircularProgressIndicator(
                          color: AppColors.loader1,
                        )),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0; i < model.allSalesData.length; i++)
                          GestureDetector(
                            onTap: () {
                              model.gotoSalesDetails(model.allSalesData[i]);
                            },
                            child: StatusCardFourPart(
                              // status: 0,
                              title: model.allSalesData[i].invoiceNumber!,
                              price:
                                  "${model.allSalesData[i].currency!} ${model.allSalesData[i].amount!}",
                              subTitle: model.allSalesData[i].retailerName!,
                              bodyFirstKey:
                                  'Sale Date: ${model.allSalesData[i].saleDate!}',
                              bodyFirstValue:
                                  'Due Date: ${model.allSalesData[i].dueDate!}',
                              bodySecondKey:
                                  'FIE: ${model.allSalesData[i].fieName!}',
                              statusChild: model.allSalesData[i].status!
                                  .toSaleStatus(
                                      text: model
                                          .allSalesData[i].statusDescription!),
                            ),
                          )
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

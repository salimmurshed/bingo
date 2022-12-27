part of '../../ui/add_credit_line_screen/add_credit_line_view.dart';

class MultipleSearchSelectionPart extends StatelessWidget {
  MultipleSearchSelectionPart(this.model, {Key? key}) : super(key: key);
  AddCreditLineViewModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppString.selectMultipleFie,
        ),
        10.0.giveHeight,
        SizedBox(
            width: 100.0.wp,
            child: Wrap(
              children: [
                for (var e in model.listFie)
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: () {
                        // model.addFieList(e);
                      },
                      child: Container(
                        decoration: AppBoxDecoration.borderDecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(e.bpName!),
                        ),
                      ),
                    ),
                  ),
              ],
            )),
        10.0.giveHeight,
        SizedBox(
          height: 45.0,
          child: TextFormField(
            readOnly: true,
            style: AppTextStyles.successStyle,
            decoration: AppInputStyles.ashOutlineBorder
                .copyWith(hintText: "Select FIE"),
            onTap: () async {
              await showDialog(
                context: context,
                builder: (ctx) {
                  return SizedBox(
                    height: 500.0,
                    child: MultiSelectDialog<FieCreditLineRequestData>(
                      items: model.allFieCreditLine
                          .map((e) => MultiSelectItem<FieCreditLineRequestData>(
                              e, e.bpName!))
                          .toList(),
                      initialValue: model.listFie,
                      onConfirm: (List<FieCreditLineRequestData> values) {
                        model.addFieList(values);
                        // print(values);
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
        // Container(
        //   color: AppColors.cardShaddow,
        //   height: 300.0,
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         for (var e in model.allFieCreditLine)
        //           InkWell(
        //             onTap: () {
        //               model.addFieList(e);
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.all(6.0),
        //               child: Container(
        //                 width: 100.0.wp,
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(6),
        //                   color: AppColors.cardColor,
        //                 ),
        //                 child: Padding(
        //                   padding: const EdgeInsets.symmetric(
        //                     vertical: 20.0,
        //                     horizontal: 12,
        //                   ),
        //                   child: Text(e.bpName!),
        //                 ),
        //               ),
        //             ),
        //           )
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

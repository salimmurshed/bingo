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
        // 10.0.giveHeight,
        // TextField(
        //   controller: model.searchTextController,
        //   decoration: InputDecoration(
        //     suffixIcon: Icon(
        //       Icons.search,
        //       color: Colors.black,
        //       size: 20.0,
        //     ),
        //     border: InputBorder.none,
        //     hintText: 'Cerca la maison',
        //   ),
        // ),
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
                        model.addFieList(e);
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
        // ...model.allFieCreditLine.map((FieCreditLineRequestData m) {
        //   return model.filter.isEmpty || model.filter == ''
        //       ? Text(
        //           m.bpName!,
        //         )
        //       : m.bpName!.toLowerCase().contains(model.filter.toLowerCase())
        //           ? Text(
        //               m.bpName!,
        //             )
        //           : Container();
        // }).toList(),
        Container(
          color: AppColors.cardShaddow,
          height: 300.0,
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (var e in model.allFieCreditLine)
                  InkWell(
                    onTap: () {
                      model.addFieList(e);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: 100.0.wp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.cardColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 12,
                          ),
                          child: Text(e.bpName!),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

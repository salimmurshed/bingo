part of '../../ui/add_credit_line_screen/add_credit_line_view.dart';

class ImageCreditLineParts extends StatelessWidget {
  ImageCreditLineParts(this.model, {Key? key}) : super(key: key);
  AddCreditLineViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.files,
          style: AppTextStyles.dashboardBodyTitle,
        ),
        const Divider(),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          alignment: WrapAlignment.spaceBetween,
          children: [
            for (var i = 0; i < model.fileList.length; i++)
              if (model.fileList[i].retailerDocument!.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  width: 100.0,
                  decoration: AppBoxDecoration.borderDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100.0,
                        child: SizedBox(
                          child: Stack(
                            children: [
                              Image.asset(
                                AppAsset.fileImage,
                                fit: BoxFit.fitWidth,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ],
    );
  }
}

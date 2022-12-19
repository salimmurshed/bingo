part of '../../ui/add_credit_line_screen/add_credit_line_view.dart';

class ImageCreditLineParts extends StatelessWidget {
  ImageCreditLineParts(this.model, {Key? key}) : super(key: key);
  AddCreditLineViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppString.files,
          style: AppTextStyles.dashboardBodyTitle,
        ),
        const Divider(),
        for (var i = 0; i < model.fileList.length; i++)
          if (model.fileList[i].retailerDocument!.isNotEmpty)
            Container(
              width: 100.0.wp,
              decoration: AppBoxDecoration.borderDecoration,
              child: Row(
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
                  Flexible(
                    child: Text(model.fileList[i].retailerDocument!),
                  )
                ],
              ),
            ),
      ],
    );
  }
}

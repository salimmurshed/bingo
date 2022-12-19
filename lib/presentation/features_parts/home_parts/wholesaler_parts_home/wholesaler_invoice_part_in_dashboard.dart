part of '../../../ui/home_screen/home_screen_view.dart';

class WholesalerInvoicePartInDashboard extends StatelessWidget {
  final InvoiceModel invoiceData;
  const WholesalerInvoicePartInDashboard(this.invoiceData, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppMargins.wholesalerInDashboardMarginB,
      padding: AppPaddings.wholesalerInDashboardPadding,
      decoration: BoxDecoration(
        borderRadius: AppRadius.wholesalerInDashboardRadius,
        border: Border.all(color: AppColors.borderColors),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 35.0.wp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getNiceText("${AppString.invoiceTo}: ${invoiceData.invoiceTo}",
                    nxtln: true),
                getNiceText("Date of Invoice: ${invoiceData.dateOfInvoice}",
                    nxtln: true),
                getNiceText("Amount: RD\$ ${invoiceData.amount}", nxtln: true),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child:
                      statusNamesEnumFromServer(invoiceData.status).toStatus(),
                ),
                getNiceText("Days to Payments: ${invoiceData.paymentDuration}",
                    nxtln: true),
                getNiceText("S.No: ${invoiceData.sNo}", nxtln: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

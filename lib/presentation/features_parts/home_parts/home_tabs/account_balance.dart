part of '../../../ui/home_screen/home_screen_view.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({Key? key, required this.model}) : super(key: key);
  final HomeScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppMargins.accountBalanceMarginB,
      padding: AppPaddings.accountBalancePadding,
      width: 100.0.wp,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int j = 0; j < 10; j++)
              const AccountBalanceCard(
                title: "Balance: RD\$ 0"
                    ".00",
                subTitleList: [
                  "Account Type: Saving",
                  "Acc"
                      "ount No.: ",
                  "Bank Name: Banco Prueba "
                      "1",
                  "IBAN: ",
                  "Date:2022-06-19 18:52:42",
                  "Date/Time Updated: "
                      "2022-06-19 18:52:42"
                ],
              )
          ],
        ),
      ),
    );
  }
}
